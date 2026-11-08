#!/usr/bin/env python3
"""KERNEL RAIN: a tutorial you can run (Linux, Python 3, standard library).

GOAL
====
Imagine 30 vertical LED strips, each containing 60 independently controlled
LEDs. This program models them as a 30 x 60 grid. In a terminal we display
Japanese/ASCII characters instead of LEDs; later the same grid could be sent
to an ESP32 and rendered as green light.

Follow the numbered STEP sections from top to bottom. The pipeline is:

    /proc process table -> process drops -> deterministic frame -> curses

Try:
    python3 kernel_rain.py
    python3 kernel_rain.py --glyphs katakana --fps 30
    python3 kernel_rain.py --fill --source ebpf  # Fit terminal, resize live

Controls: q quit, space pause animation, r reset learned baselines and
process tracking. Each visible drop represents a process. In --source ebpf
mode real sched_switch events (CPU, PIDs, timestamp) may mutate the matching
process trail.
With --fill, terminal width and height determine the simulated grid.
Each column uses two terminal cells for Japanese glyph alignment; two
terminal lines are reserved for status. Resizing preserves existing rain.
"""

# STEP 1: Imports. curses is Python's ncurses interface; no pip install needed.
import argparse
import curses
import hashlib
import locale
import math
import os
import time
import unicodedata
from dataclasses import dataclass
from pathlib import Path

# STEP 2: Glyphs are *terminal artwork*, not physical LED characters.
# Most Japanese glyphs occupy TWO terminal character cells. We reserve two
# cells for every simulated LED, even for ASCII, to keep columns aligned.
GLYPHS = {
    'katakana': 'アイウエオカキクケコサシスセソタチツテトナニヌネノハヒフヘホマミムメモヤユヨラリルレロワヲン',
    'hiragana': 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん',
    'kanji': '雨水風火山川空月日光電気雲森海星夜夢時心音流速静動',
    'ascii': '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ@#$%&*+',
}
CHANNELS = ('cpu', 'switches', 'forks', 'disk', 'net')


def clamp(x, low=0.0, high=1.0):
    """Keep an intensity between 0 and 1."""
    return max(low, min(high, x))


# STEP 3: Read kernel counters from procfs.
# These are cumulative since boot. The useful signal is the CHANGE over time,
# not the raw value. Reading procfs is cheap and needs no root privileges.
def read_kernel_counters():
    lines = Path('/proc/stat').read_text(encoding='ascii').splitlines()
    cpu_fields = list(map(int, lines[0].split()[1:]))
    result = {
        'cpu_total': sum(cpu_fields),
        'cpu_idle': cpu_fields[3] + (cpu_fields[4] if len(cpu_fields) > 4 else 0),
        'switches': 0, 'forks': 0, 'disk': 0, 'net': 0,
    }
    for line in lines[1:]:
        if line.startswith('ctxt '):
            result['switches'] = int(line.split()[1])
        elif line.startswith('processes '):
            # This is fork/clone activity, NOT the number of running processes.
            result['forks'] = int(line.split()[1])

    # Linux diskstats records sector counts (normally 512-byte units).
    # Select whole block devices; exclude partitions and virtual loop devices.
    try:
        for line in Path('/proc/diskstats').read_text().splitlines():
            p = line.split()
            if len(p) < 10:
                continue
            name = p[2]
            whole_nvme = name.startswith('nvme') and 'p' not in name
            whole_sd = name.startswith(('sd', 'vd', 'xvd')) and name[-1].isalpha()
            if whole_nvme or whole_sd:
                result['disk'] += (int(p[5]) + int(p[9])) * 512
    except OSError:
        pass  # Not all containers expose diskstats.

    try:
        for line in Path('/proc/net/dev').read_text().splitlines()[2:]:
            iface, data = line.split(':', 1)
            if iface.strip() != 'lo':
                fields = data.split()
                result['net'] += int(fields[0]) + int(fields[8])
    except OSError:
        pass
    return result


# STEP 4: Learn what 'normal' looks like.
# An exponentially weighted moving mean adapts to your machine over time.
# A fixed threshold (e.g. 10 MB/s) is poor because different computers and
# workloads have very different idle/background rates.
class AdaptiveBaseline:
    def __init__(self, learning_seconds=45.0):
        self.mean = None
        self.variance = 0.0
        self.learning_seconds = learning_seconds

    def observe(self, value, elapsed):
        if self.mean is None:
            self.mean = value
            return 0.25  # Modest activity until a baseline exists.
        alpha = 1.0 - math.exp(-elapsed / self.learning_seconds)
        delta = value - self.mean
        self.mean += alpha * delta
        self.variance = (1 - alpha) * (self.variance + alpha * delta * delta)
        # 0.25 = baseline ambience; higher values mean unusually high activity.
        z = (value - self.mean) / math.sqrt(self.variance + 0.01)
        return clamp(0.25 + z / 5.0)


# STEP 5: Turn snapshots into rates and normalised intensities.
class LinuxTelemetry:
    def __init__(self):
        self.previous = read_kernel_counters()
        self.previous_time = time.monotonic()
        self.baselines = {key: AdaptiveBaseline() for key in CHANNELS[1:]}
        self.intensity = {key: 0.25 for key in CHANNELS}
        self.rates = {key: 0.0 for key in CHANNELS[1:]}
        self.event_data = {key: (0, 0) for key in CHANNELS}
        self.sample_index = 0

    def sample(self):
        current = read_kernel_counters()
        now = time.monotonic()
        dt = max(now - self.previous_time, 0.001)
        total = current['cpu_total'] - self.previous['cpu_total']
        idle = current['cpu_idle'] - self.previous['cpu_idle']
        self.sample_index += 1
        self.event_data["cpu"] = (max(0, total - idle), max(0, total))
        if total > 0:
            self.intensity['cpu'] = clamp(1.0 - idle / total)
        for key, baseline in self.baselines.items():
            delta = max(0, current[key] - self.previous[key])
            rate = delta / dt
            self.event_data[key] = (delta, current[key])
            self.rates[key] = rate
            # log1p compresses spikes (e.g. compilation or large downloads).
            self.intensity[key] = baseline.observe(math.log1p(rate), dt)
        self.previous, self.previous_time = current, now


# STEP 6: Read the process table. A process identity includes its start time
# because Linux can reuse a PID after a process exits.
@dataclass(frozen=True)
class ProcessState:
    pid: int
    start_time: int
    name: str
    state: str
    cpu_ticks: int
    cpu_delta: int
    rss_pages: int
    threads: int

    @property
    def identity(self):
        return self.pid, self.start_time


def read_process_table():
    """Return process snapshots from procfs without requiring root."""
    processes = {}
    for path in Path('/proc').glob('[0-9]*/stat'):
        try:
            text = path.read_text(encoding='utf-8')
            close = text.rfind(')')
            if close < 0:
                continue
            pid = int(text[:text.find(' ')])
            name = text[text.find('(') + 1:close]
            fields = text[close + 2:].split()
            # fields starts at stat field 3 (state).
            processes[(pid, int(fields[19]))] = ProcessState(
                pid=pid,
                start_time=int(fields[19]),
                name=name,
                state=fields[0],
                cpu_ticks=int(fields[11]) + int(fields[12]),
                cpu_delta=0,
                rss_pages=max(0, int(fields[21])),
                threads=int(fields[17]),
            )
        except (OSError, ValueError, IndexError):
            # A process can disappear while its stat file is being read.
            continue
    return processes


class LinuxProcesses:
    """Turn successive process tables into process activity snapshots."""

    def __init__(self):
        self.previous = read_process_table()
        self.thread_owners = {}

    def sample(self, include_threads=False):
        current = read_process_table()
        result = {}
        owners = {}
        for identity, process in current.items():
            previous = self.previous.get(identity)
            delta = max(0, process.cpu_ticks - previous.cpu_ticks) if previous else 0
            result[identity] = ProcessState(
                pid=process.pid,
                start_time=process.start_time,
                name=process.name,
                state=process.state,
                cpu_ticks=process.cpu_ticks,
                cpu_delta=delta,
                rss_pages=process.rss_pages,
                threads=process.threads,
            )
            if include_threads:
                try:
                    for task in Path(f'/proc/{process.pid}/task').iterdir():
                        owners[int(task.name)] = identity
                except (OSError, ValueError):
                    pass
        self.thread_owners = owners
        self.previous = current
        return result


# STEP 7: A drop is a visual projection of one process. Its head can be
# fractional so movement stays smooth even when speed is < 1 LED per frame.
@dataclass
class Drop:
    process: ProcessState
    head: float
    speed: float                 # LED cells per second
    glyphs: list[str]            # Deterministic glyph for every trail position
    active: bool = True
    fade: float = 1.0
    entry_delay: float = 0.0
    entered: bool = True

    @property
    def length(self):
        return len(self.glyphs)


# STEP 8: Simulation is independent of the terminal renderer.
class RainSimulation:
    def __init__(self, columns, rows, glyphs, seed=None):
        self.columns, self.rows = columns, rows
        self.glyphs = glyphs
        self.seed = seed if seed is not None else 0
        self.drops = [[] for _ in range(columns)]
        self.process_drops = {}
        self.process_columns = {}
        self.startup_duration = 5.0
        self.started_columns = set()
        self.column_wait = [0.0] * columns
        self.clock_ticks = os.sysconf('SC_CLK_TCK')

    def resize(self, columns, rows):
        """Adapt to terminal resize without resetting active animation."""
        old = self.drops
        self.drops = [[] for _ in range(columns)]
        for x, queue in enumerate(old):
            for drop in queue:
                target = x % columns
                if self.drops[target] and drop.entered:
                    # A merged column has one visible stream. Resume the
                    # displaced stream from the top when its turn comes.
                    drop.entered = False
                    drop.head = -1.0
                self.drops[target].append(drop)
                self.process_columns[drop.process.identity] = target
        self.column_wait = (self.column_wait + [0.0] * columns)[:columns]
        self.started_columns = {x for x in self.started_columns if x < columns}
        self.columns, self.rows = columns, rows

    def _column_for(self, identity):
        """Place new processes in the least populated column."""
        if identity in self.process_columns:
            return self.process_columns[identity] % self.columns
        payload = f'{identity[0]}:{identity[1]}:{self.seed}'.encode('ascii')
        start = int.from_bytes(hashlib.blake2s(payload, digest_size=8).digest(), 'big') % self.columns
        count = min(map(len, self.drops))
        column = next((start + offset) % self.columns for offset in range(self.columns)
                      if len(self.drops[(start + offset) % self.columns]) == count)
        self.process_columns[identity] = column
        return column

    def _glyphs_for(self, process, length):
        """Create stable artwork from process identity and trail position."""
        result = []
        for distance in range(length):
            payload = (f'{process.pid}:{process.start_time}:{process.name}:'
                       f'{distance}:{self.seed}').encode('utf-8', 'replace')
            value = int.from_bytes(
                hashlib.blake2s(payload, digest_size=8).digest(), 'big')
            result.append(self.glyphs[value % len(self.glyphs)])
        return result

    def _trail_length(self, process):
        # Shape currently reflects memory/thread count; glyph meanings come in
        # the next phase.
        memory_part = min(8, int(math.log2(process.rss_pages + 1)))
        thread_part = min(4, max(0, process.threads - 1))
        return max(5, min(16, 5 + memory_part + thread_part))

    def _startup_delay(self, identity):
        payload = f'start:{identity[0]}:{identity[1]}:{self.seed}'.encode('ascii')
        value = int.from_bytes(hashlib.blake2s(payload, digest_size=8).digest(), 'big')
        return (value / (2**64 - 1)) * self.startup_duration

    def sync_processes(self, processes, elapsed):
        """Track every process while keeping each column's queue stable."""
        current = sorted(processes.values(), key=lambda process: process.identity)
        live = {process.identity for process in current}
        for identity, drop in self.process_drops.items():
            if identity not in live:
                drop.active = False
        for process in current:
            identity = process.identity
            drop = self.process_drops.get(identity)
            if drop is None:
                length = self._trail_length(process)
                drop = Drop(
                    process, -1.0, 3.0, self._glyphs_for(process, length),
                    entered=False,
                )
                self.process_drops[identity] = drop
                self.drops[self._column_for(identity)].append(drop)
            else:
                drop.process = process
                drop.active = True
                drop.fade = 1.0
            # /proc CPU time is in clock ticks; use it to control motion.
            cpu_rate = process.cpu_delta / max(elapsed * self.clock_ticks, 0.001)
            drop.speed = 8.0 + 12.0 * clamp(cpu_rate)

    def step(self, dt, intensity=None):
        for x in range(self.columns):
            queue = self.drops[x]
            if not queue:
                continue
            drop = queue[0]
            if not drop.entered:
                if x not in self.started_columns:
                    self.column_wait[x] = self._startup_delay(drop.process.identity)
                    self.started_columns.add(x)
                self.column_wait[x] = max(0.0, self.column_wait[x] - dt)
                if self.column_wait[x] > 0.0:
                    continue
                drop.entered = True
            drop.head += drop.speed * dt
            if not drop.active:
                drop.fade *= math.exp(-dt / 0.8)
                # A process that exited while waiting still gets one brief
                # visible pass; fading begins when it enters the column.
            if drop.head - drop.length >= self.rows:
                queue.pop(0)
                if drop.active:
                    drop.head = -1.0
                    drop.entered = False
                    queue.append(drop)
                else:
                    self.process_drops.pop(drop.process.identity, None)
                    self.process_columns.pop(drop.process.identity, None)
                self.column_wait[x] = 0.4 + self._startup_delay(drop.process.identity) / 6.0

    def apply_schedule_events(self, events, thread_owners=None):
        """Use scheduler events to mutate the matching process trail."""
        by_pid = {drop.process.pid: drop for drop in self.process_drops.values()
                  if drop.active}
        for event in events:
            identity = thread_owners.get(event.next_pid) if thread_owners else None
            drop = (self.process_drops.get(identity) if identity else
                    by_pid.get(event.next_pid))
            if drop is None or not drop.active:
                continue
            distance = (event.prev_pid ^ event.next_pid ^
                        (event.timestamp_ns >> 12)) % drop.length
            payload = (f'{event.cpu}:{event.prev_pid}:{event.next_pid}:'
                       f'{event.timestamp_ns}').encode('ascii')
            value = int.from_bytes(
                hashlib.blake2s(payload, digest_size=8).digest(), 'big')
            drop.glyphs[distance] = self.glyphs[value % len(self.glyphs)]

    def pixels(self):
        """Return grid[row][column] = (glyph, brightness tier 0..3)."""
        grid = [[(' ', 0) for _ in range(self.columns)] for _ in range(self.rows)]
        for x, drops in enumerate(self.drops):
            for drop in drops[:1]:
                if not drop.entered:
                    continue
                for distance, glyph in enumerate(drop.glyphs):
                    y = int(drop.head) - distance
                    if 0 <= y < self.rows:
                        fraction = distance / drop.length
                        tier = 3 if distance == 0 else (2 if fraction < 0.45 else 1)
                        if drop.fade < 0.75:
                            tier -= 1
                        if drop.fade < 0.25:
                            tier = 0
                        if tier >= grid[y][x][1]:
                            grid[y][x] = (glyph, tier)
        return grid


# STEP 8: Terminal presentation. curses handles keyboard input, colours and
# drawing. Wide Unicode characters require a UTF-8 locale and suitable font.
def draw(stdscr, simulation, telemetry, paused, ebpf_status=""):
    height, width = stdscr.getmaxyx()
    try:
        stdscr.erase()
    except curses.error:
        return
    needed_width = simulation.columns * 2
    if width < needed_width or height < 3:
        message = f'Enlarge terminal: width >= {needed_width}, height >= 4'
        if height > 0 and width > 1:
            try:
                stdscr.addnstr(0, 0, message, width - 1)
                stdscr.refresh()
            except curses.error:
                pass
        return

    visible_rows = min(simulation.rows, height - 2)
    for y, row in enumerate(simulation.pixels()[:visible_rows]):
        for x, (glyph, brightness) in enumerate(row):
            if brightness == 0:
                continue
            attr = curses.color_pair(brightness) if curses.has_colors() else 0
            if brightness == 1:
                attr |= curses.A_DIM
            elif brightness == 3:
                attr |= curses.A_BOLD
            # A two-cell stride accommodates full-width Japanese glyphs.
            # ASCII is padded by the unused cell; Unicode widths are checked.
            if unicodedata.east_asian_width(glyph) not in ('F', 'W') and len(glyph) != 1:
                continue
            try:
                stdscr.addstr(y, x * 2, glyph, attr)
            except curses.error:
                pass  # Bottom/right edge behaviour varies by terminal.

    active_processes = sum(
        1 for drop in simulation.process_drops.values() if drop.active
    )
    info = (f'CPU {telemetry.intensity["cpu"]*100:3.0f}% | '
            f'proc {active_processes:3d} | '
            f'switch {telemetry.rates["switches"]:,.0f}/s | '
            f'fork {telemetry.rates["forks"]:,.0f}/s | '
            f'disk {telemetry.rates["disk"]/1e6:.1f} MB/s | '
            f'net {telemetry.rates["net"]/1e6:.1f} MB/s')
    try:
        stdscr.addnstr(height - 2, 0, info, max(0, width - 1))
    except curses.error:
        pass
    footer = f'{simulation.columns}x{simulation.rows} LEDs | q quit | space pause | r relearn'
    if ebpf_status:
        footer += ' | ' + ebpf_status
    if paused:
        footer += ' | PAUSED'
    try:
        stdscr.addnstr(height - 1, 0, footer, max(0, width - 1))
        stdscr.refresh()
    except curses.error:
        pass


# STEP 9: Main loop. Telemetry is sampled slowly; animation runs more often.
# Keeping these clocks separate makes the rain smooth even when /proc sampling
# is only performed every 200 ms. monotonic() is safe from wall-clock changes.
def run(stdscr, args):
    try:
        curses.curs_set(0)
    except curses.error:
        pass
    stdscr.nodelay(True)
    stdscr.keypad(True)
    if curses.has_colors():
        curses.start_color()
        try:
            curses.use_default_colors()
        except curses.error:
            pass
        for tier, colour in ((1, curses.COLOR_GREEN), (2, curses.COLOR_GREEN),
                             (3, curses.COLOR_WHITE)):
            curses.init_pair(tier, colour, -1)

    glyphs = ''.join(GLYPHS[name] for name in args.glyphs.split(','))
    # --fill maps two terminal character cells to one LED column and
    # reserves two lines for telemetry and controls. Leave the last terminal
    # cell unused to avoid bottom-right curses drawing edge cases.
    def terminal_grid():
        height, width = stdscr.getmaxyx()
        return max(1, (width - 1) // 2), max(1, height - 2)

    columns, rows = terminal_grid() if args.fill else (args.columns, args.rows)
    rain = RainSimulation(columns, rows, glyphs, args.seed)
    telemetry = LinuxTelemetry()
    processes = LinuxProcesses()
    collector = None
    if args.source == 'ebpf':
        from ebpf_events import SchedulerCollector
        collector = SchedulerCollector()
    ebpf_status = 'eBPF scheduler' if collector else 'procfs'
    paused = False
    last_frame = time.monotonic()
    next_poll = last_frame + args.poll

    try:
      while True:
        frame_start = time.monotonic()
        dt = min(frame_start - last_frame, 0.1)
        last_frame = frame_start
        if args.fill:
            # curses.getmaxyx() reflects terminal changes; KEY_RESIZE may
            # also arrive, but polling dimensions works across terminals.
            columns, rows = terminal_grid()
            if (columns, rows) != (rain.columns, rain.rows):
                rain.resize(columns, rows)
        key = stdscr.getch()
        if key in (ord('q'), ord('Q'), 27):
            break
        if key == ord(' '):
            paused = not paused
        if key == ord('r'):
            telemetry = LinuxTelemetry()
            processes = LinuxProcesses()
            next_poll = frame_start + args.poll
        if frame_start >= next_poll:
            try:
                telemetry.sample()
                process_snapshot = processes.sample(include_threads=collector is not None)
                rain.sync_processes(process_snapshot, args.poll)
            except (OSError, ValueError, IndexError):
                pass  # Keep rendering if a transient procfs read fails.
            next_poll = frame_start + args.poll
        if collector is not None:
            events, lost = collector.drain(max_items=args.max_events_per_frame)
            if not paused:
                rain.apply_schedule_events(events, processes.thread_owners)
            ebpf_status = f'eBPF sched_switch {len(events)}/frame dropped {lost}'
            if collector.error:
                ebpf_status = 'eBPF ERROR: ' + collector.error
        if not paused:
            rain.step(dt, telemetry.intensity)
        draw(stdscr, rain, telemetry, paused, ebpf_status)
        time.sleep(max(0.0, 1.0 / args.fps - (time.monotonic() - frame_start)))
    finally:
        if collector is not None:
            collector.close()


# STEP 10: Command-line interface. Validate options before curses takes over.
def main():
    locale.setlocale(locale.LC_ALL, '')
    parser = argparse.ArgumentParser(description=__doc__,
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('--fill', action='store_true',
                        help='Fill terminal; auto-detect columns and rows, including live resize')
    parser.add_argument('--columns', type=int, default=30)
    parser.add_argument('--rows', type=int, default=60)
    parser.add_argument('--fps', type=float, default=30)
    parser.add_argument('--poll', type=float, default=0.2, help='Seconds between kernel samples')
    parser.add_argument('--glyphs', default='katakana,hiragana,kanji,ascii',
                        help='Comma-separated: katakana,hiragana,kanji,ascii')
    parser.add_argument('--source', choices=('proc', 'ebpf'), default='proc',
                        help='Use procfs counters or real eBPF sched_switch events')
    parser.add_argument('--max-events-per-frame', type=int, default=4096,
                        help='Limit eBPF events processed per animation frame')
    parser.add_argument('--seed', type=int, default=None, help='Fixed random seed for experiments')
    args = parser.parse_args()
    if args.columns < 1 or args.rows < 1 or args.fps <= 0 or args.poll <= 0 or args.max_events_per_frame < 1:
        parser.error('columns, rows, fps and poll must be positive')
    names = args.glyphs.split(',')
    if not names or any(name not in GLYPHS for name in names):
        parser.error('glyphs must be comma-separated names: ' + ', '.join(GLYPHS))
    try:
        curses.wrapper(run, args)  # Restores terminal state even on exceptions.
    except KeyboardInterrupt:
        pass


if __name__ == '__main__':
    main()
