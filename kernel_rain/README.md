# Kernel Rain

A Linux-only, standard-library Python curses simulator of a 30-column × 60-pixel green LED rain wall. Drops represent processes discovered through read-only `/proc`. CPU activity controls speed; memory, threads, and sustained activity control length. Current process measurements fill the six characters nearest the head, and recent activity fills the rest. No root privileges, eBPF, or third-party packages are required for the default mode.

## Run

```bash
export LANG=en_GB.UTF-8
python3 kernel_rain.py
```

Use a terminal with a Japanese-capable monospace font, at least 60 columns and ideally 63 rows. If your terminal is shorter, the first visible part of the 60-row model is shown; the underlying simulation still has 60 pixels per strip.

```bash
python3 kernel_rain.py --glyphs katakana,hiragana,kanji,ascii --fps 30
python3 kernel_rain.py --glyphs ascii  # use ASCII variants for all positions
```

Controls: `q` or Escape quits, Space freezes the picture, `r` resets adaptive baselines and process sampling. Collection continues during a pause; observations made while paused are not replayed.

## Mapping

Every discovered process has a drop, assigned to a column with the fewest queued processes. Each column shows one stream at a time and cycles through its queue as streams finish. Initial column entries are staggered, and a short gap separates successive streams. A terminated process fades until invisible, then releases its column; a live process returns to its column queue after reaching the bottom. The status line reports aggregate CPU, context-switch, fork, disk and network activity.

The status line also shows CPU temperature from a recognized Linux hwmon
sensor (`k10temp`, `coretemp`, or `zenpower`). It prefers `Tdie`, then `Tctl`,
then a package sensor, and displays the sensor label alongside °C. `Tctl` is
the control-temperature reading exposed by the driver. If no CPU sensor is
available, it shows `temp n/a`. Temperature is sampled with the other
telemetry; it does not currently affect the drops.

## Caveats

`forks` comes from the cumulative Linux `processes` counter (process/thread creations), not executable launches. Disk throughput uses whole-device sector counters and may miss some device types. Network counters are from the current network namespace. Baselines use exponentially weighted mean and variance of log-rates; the system adapts over approximately 45 seconds and is not an ML model. Unicode terminal cells are not physical LEDs; the eventual LED backend should consume brightness tiers instead of glyphs.

## Process-backed visualisation

Each drop is backed by a `(PID, process start time)` identity, so PID reuse does
not accidentally continue an old process's visual stream. The six characters
nearest the bright head have fixed meanings. Read
from the head backwards:

| Position | Meaning | Kanji |
|---|---|---|
| 1 | Process state | `走` running, `眠` sleeping/idle, `待` uninterruptible wait, `止` stopped, `終` zombie/exiting, `不` other |
| 2 | CPU used during last sample, as a fraction of one core | `静` <1%, `低` <10%, `中` <50%, `高` ≥50% |
| 3 | Resident memory change since last sample | `増` more than 16 pages gained, `減` more than 16 lost, `定` otherwise |
| 4 | Storage I/O since last sample | `無` none, `読` reads, `書` writes, `双` both, `不` unavailable |
| 5 | Thread count change | `増` increased, `減` decreased, `定` unchanged |
| 6 | Strongest system-wide pressure over 10 seconds | `静` below 5%, `算` CPU, `憶` memory, `入` I/O, `不` unavailable |

Each meaning has kanji, hiragana, katakana and ASCII variants. `--glyphs`
selects which scripts are allowed; selecting only one script removes script
rotation. A process's
identity and `--seed` select each position's initial form. Its form advances
when a relevant measured counter crosses a step: state changes or eight
scheduler events, 0.1 CPU-seconds, 16 pages of cumulative memory movement,
64 KiB of storage I/O, a thread-count change, or one second of accumulated
system stall time, respectively. When a local counter stays still, aggregate
kernel context switches provide a slower pulse. Each process and position has
a seeded cadence of 8,000–31,999 switches, so quiet drops also change form
without changing meaning. Kana are one-character reading cues and ASCII is a mnemonic
for the position; consult the position first when interpreting one.
The characters beyond the six current-state positions record
recent process activity, newest first. Each `/proc` sample adds one character:

| Activity selected from a sample | Kanji |
|---|---|
| CPU work | `算` |
| Storage read or write | `読` or `書` |
| Resident memory growth or shrinkage | `増` or `減` |
| Thread creation or removal | `生` or `散` |
| eBPF scheduling activity, when enabled | `切` |
| No notable change | `静` |

When several kinds of activity occur in one sample, the strongest normalized
signal wins; this is a visual summary, not a complete event log. The symbol's
script is selected once when the sample is added and remains unchanged as it
moves toward the end of the tail. A blank tail position means no sample has
filled it yet. Short-lived processes can retain samples while queued.
The pressure character describes the whole system, not a fault in this process.
Tail length now changes between 6 and 16 characters. Resident memory and
thread count set its baseline; CPU and storage I/O activity smoothed over
about four seconds can add up to three temporary cells. The tail adds or
removes at most one history position every 0.4 seconds, at the far end of
the stream. The six semantic positions always remain. These kanji are concise
visual labels, not conventional diagnostic codes.

The process table is sampled periodically. Every discovered process joins a
column queue, though only the first stream in each column is drawn at a time.
With more processes than columns, each process appears in turn rather than all
at once. The display remains an intuition-building view rather than an exact
process monitor.

## Follow one process through the program

1. `read_process_table()` reads `/proc/<pid>/stat` for process state, CPU ticks,
   resident pages, thread count and start time. It also attempts to read
   `/proc/<pid>/io`. If I/O counters are inaccessible, the I/O position uses
   the unknown symbol. `(PID, start time)` identifies a process across samples:
   a reused PID creates a different drop.
2. `LinuxProcesses.sample()` compares this table with the previous one. It
   calculates changes in CPU ticks, resident pages, thread count, and read and
   write bytes. The elapsed time is measured with a monotonic clock, so a slow
   sample does not pretend it took exactly `--poll` seconds. Separate global
   telemetry supplies status-line rates and a cumulative context-switch count;
   `/proc/pressure` supplies CPU, memory and I/O stall information.
3. `RainSimulation.sync_processes()` creates a drop for a new process. It puts
   the drop in a least-populated column queue. Only the front process in each
   queue is drawn. Its bright head starts above the screen at row `-1`.
4. Six fixed positions behind the head describe the *latest* sample. For
   instance, `眠 低 定 読 定 静` means sleeping, low recent CPU use, stable
   resident memory, storage reads, stable thread count, and low system
   pressure. This is an illustrative kanji-only reading: with the default
   glyph selection each position may instead show a kana or ASCII equivalent.
   The pressure position describes the whole system, not this process alone.
5. The remaining positions are a short history. At each sample, the strongest
   classified activity enters immediately after position six. Existing history
   shifts toward the far end and the oldest observation drops away. Each
   history symbol keeps its chosen form. Tail length responds gradually to
   resident memory, threads, and sustained CPU or storage activity, from six
   to sixteen positions. CPU use also raises falling speed above the minimum
   eight rows per second.
6. The first six symbols may rotate among forms while their meaning stays
   fixed. Their own counters take priority. If a local counter is still, the
   global context-switch counter can advance its form at a different seeded
   cadence for each process and position. This produces motion in quiet drops
   without changing their measured category. A fixed seed gives repeatable
   choices when the observations and sampling sequence are the same.
7. `step()` moves the head down with elapsed frame time, and `pixels()` places
   each glyph at `int(head) - distance`. The head is bright; older positions
   are dimmer. A live process goes to the back of its column queue after its
   tail clears the bottom. A process that exited is removed once it fades
   from view. The renderer displays the grid in curses; it does not decide
   what the glyphs mean.

## Real scheduler events via eBPF (optional)

The tutorial now has two data sources:

```bash
python3 kernel_rain.py --source proc    # no special permissions
```

For scheduler-event observations, install BCC and run with the required kernel tracing privileges. On Ubuntu/Debian, the BCC package is commonly `python3-bpfcc`; depending on distribution, its Python module may be installed for `/usr/bin/python3` rather than a virtual environment:

```bash
sudo apt update
sudo apt install python3-bpfcc bpfcc-tools linux-headers-$(uname -r)
sudo /usr/bin/python3 kernel_rain.py --source ebpf
```

Kernel headers package availability depends on the installed kernel; BCC may work without matching headers on systems with sufficient kernel type information. `sudo` is needed on many configurations to attach eBPF tracepoints. Do not run arbitrary downloaded code as root: inspect `ebpf_events.py` first.

### How event-driven mutation works

`ebpf_events.py` contains a small C eBPF program attached to `sched:sched_switch`. It sends timestamp, CPU, previous PID and next PID to a bounded Python queue through a BPF perf buffer. A background thread polls the perf buffer. The curses loop drains up to `--max-events-per-frame` events per frame and counts matches for the process's next activity-history sample. No command lines or process names are captured by the eBPF collector.

`--source proc` remains the default for compatibility and as a fallback. If BCC is missing or tracepoint attachment is denied, eBPF mode reports an error instead of silently claiming to show real scheduler events.

Note: the visual mapping is not a lossless event log; events may be dropped under load, and multiple scheduling events can contribute to one sampled history symbol. This is a teaching implementation; production installations should aggregate events in eBPF maps to reduce overhead.

## Fill the terminal automatically

```bash
python3 kernel_rain.py --fill
sudo /usr/bin/python3 kernel_rain.py --source ebpf --fill
```

`--fill` determines the simulation grid from the current terminal dimensions:
`columns = max(1, (terminal_width - 1) // 2)` and
`rows = max(1, terminal_height - 2)`. Japanese characters use two terminal
cells; the bottom two rows show telemetry and controls. Terminal resizing is
detected during animation and preserves surviving streams. `--columns` and
`--rows` are ignored in fill mode. Very small terminals may show a size warning.
