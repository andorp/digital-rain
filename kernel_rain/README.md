# Kernel Rain

A Linux-only, standard-library Python curses simulator of a 30-column × 60-pixel green LED rain wall. Visible drops represent real processes discovered through read-only `/proc`. Process identity deterministically selects a trail, CPU activity controls its speed, and memory/thread state affects its length. No root privileges, eBPF, or third-party packages are required for the default mode.

## Run

```bash
export LANG=en_GB.UTF-8
python3 kernel_rain.py
```

Use a terminal with a Japanese-capable monospace font, at least 60 columns and ideally 63 rows. If your terminal is shorter, the first visible part of the 60-row model is shown; the underlying simulation still has 60 pixels per strip.

```bash
python3 kernel_rain.py --glyphs katakana,hiragana,kanji,ascii --fps 30
python3 kernel_rain.py --glyphs ascii
```

Controls: `q` or Escape quits, Space pauses, `r` resets adaptive baselines.

## Mapping

Every discovered process has a drop, assigned to a column with the fewest queued processes. Each column shows one stream at a time and cycles through its queue as streams finish. Initial column entries are staggered, and a short gap separates successive streams. A process receives a stable column and deterministic glyph trail based on its PID, start time and executable name. A terminated process that is already visible continues falling and fades; a live process returns to its column queue after reaching the bottom. The status line also reports aggregate CPU, context-switch, fork, disk and network activity.

## Caveats

`forks` comes from the cumulative Linux `processes` counter (process/thread creations), not executable launches. Disk throughput uses whole-device sector counters and may miss some device types. Network counters are from the current network namespace. Baselines use exponentially weighted mean and variance of log-rates; the system adapts over approximately 45 seconds and is not an ML model. Unicode terminal cells are not physical LEDs; the eventual LED backend should consume brightness tiers instead of glyphs.

## Process-backed visualisation

Each drop is backed by a `(PID, process start time)` identity, so PID reuse does
not accidentally continue an old process's visual stream. The first visual
phase intentionally gives glyphs stable identity rather than semantic meaning.
The next phase can encode process state, executable names, scheduler state and
other fields into the glyphs without changing the renderer or lifecycle model.

The process table is sampled periodically. Every discovered process joins a
column queue, though only the first stream in each column is drawn at a time.
With more processes than columns, each process appears in turn rather than all
at once. The display remains an intuition-building view rather than an exact
process monitor.

## Real scheduler events via eBPF (optional)

The tutorial now has two data sources:

```bash
python3 kernel_rain.py --source proc    # no special permissions
```

For true per-event mutation, install BCC and run with the required kernel tracing privileges. On Ubuntu/Debian, the BCC package is commonly `python3-bpfcc`; depending on distribution, its Python module may be installed for `/usr/bin/python3` rather than a virtual environment:

```bash
sudo apt update
sudo apt install python3-bpfcc bpfcc-tools linux-headers-$(uname -r)
sudo /usr/bin/python3 kernel_rain.py --source ebpf
```

Kernel headers package availability depends on the installed kernel; BCC may work without matching headers on systems with sufficient kernel type information. `sudo` is needed on many configurations to attach eBPF tracepoints. Do not run arbitrary downloaded code as root: inspect `ebpf_events.py` first.

### How event-driven mutation works

`ebpf_events.py` contains a small C eBPF program attached to `sched:sched_switch`. It sends timestamp, CPU, previous PID and next PID to a bounded Python queue through a BPF perf buffer. A background thread polls the perf buffer. The curses loop drains up to `--max-events-per-frame` events per frame and applies them to the matching visible process trail. No command lines or process names are captured.

`--source proc` remains the default for compatibility and as a fallback. If BCC is missing or tracepoint attachment is denied, eBPF mode reports an error instead of silently claiming to show real scheduler events.

Note: the visual mapping is not a lossless event log; events may be dropped under load, and a busy kernel can update the same character multiple times in a single frame. This is a teaching implementation; production installations should aggregate events in eBPF maps to reduce overhead.

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
