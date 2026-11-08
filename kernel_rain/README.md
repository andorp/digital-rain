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
python3 kernel_rain.py --glyphs ascii  # identity artwork only; semantic positions remain kanji
```

Controls: `q` or Escape quits, Space pauses, `r` resets adaptive baselines.

## Mapping

Every discovered process has a drop, assigned to a column with the fewest queued processes. Each column shows one stream at a time and cycles through its queue as streams finish. Initial column entries are staggered, and a short gap separates successive streams. A process receives a stable column and a trail whose first six kanji encode sampled measurements; the rest identify the process. A terminated process that is already visible continues falling and fades; a live process returns to its column queue after reaching the bottom. The status line also reports aggregate CPU, context-switch, fork, disk and network activity.

## Caveats

`forks` comes from the cumulative Linux `processes` counter (process/thread creations), not executable launches. Disk throughput uses whole-device sector counters and may miss some device types. Network counters are from the current network namespace. Baselines use exponentially weighted mean and variance of log-rates; the system adapts over approximately 45 seconds and is not an ML model. Unicode terminal cells are not physical LEDs; the eventual LED backend should consume brightness tiers instead of glyphs.

## Process-backed visualisation

Each drop is backed by a `(PID, process start time)` identity, so PID reuse does
not accidentally continue an old process's visual stream. The first visual
phase gives the six characters nearest the bright head fixed meanings. Read
from the head backwards:

| Position | Meaning | Kanji |
|---|---|---|
| 1 | Process state | `走` running, `眠` sleeping/idle, `待` uninterruptible wait, `止` stopped, `終` zombie/exiting, `不` other |
| 2 | CPU used during last sample, as a fraction of one core | `静` <1%, `低` <10%, `中` <50%, `高` ≥50% |
| 3 | Resident memory change since last sample | `増` more than 16 pages gained, `減` more than 16 lost, `定` otherwise |
| 4 | Storage I/O since last sample | `無` none, `読` reads, `書` writes, `双` both, `不` unavailable |
| 5 | Thread count change | `増` increased, `減` decreased, `定` unchanged |
| 6 | Strongest system-wide pressure over 10 seconds | `静` below 5%, `算` CPU, `憶` memory, `入` I/O, `不` unavailable |

Each meaning has kanji, hiragana, katakana and ASCII variants. A seeded
per-process generator chooses a variant and periodically switches to another
variant while the meaning stays the same. Kana are one-character reading cues and ASCII is a
mnemonic for the position; consult the position first when interpreting one.
Use `--seed` to repeat a sequence with the same process observations and
frame timing. The characters beyond the six current-state positions record
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

`ebpf_events.py` contains a small C eBPF program attached to `sched:sched_switch`. It sends timestamp, CPU, previous PID and next PID to a bounded Python queue through a BPF perf buffer. A background thread polls the perf buffer. The curses loop drains up to `--max-events-per-frame` events per frame and counts matches for the process's next activity-history sample. No command lines or process names are captured by the eBPF collector.

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
