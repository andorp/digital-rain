# Kernel Rain — Project Handoff

**Project:** Linux Kernel Digital Rain / Acoustic Wall LED Visualisation  
**Language:** Python 3, with optional C/eBPF through BCC  
**Platform:** Linux, primarily Ubuntu  
**Status:** Functional prototype; eBPF runtime and terminal-resizing behaviour require further validation  
**Last reviewed:** 7 November 2026

---

# 1. Project Goal and Intended Users

## 1.1 Objective

Build a real-time visualisation of Linux kernel activity, inspired by the falling digital rain from *The Matrix*.

The ultimate goal is a physical installation integrated into acoustic wooden slat panels, using individually addressable green LEDs.

The current implementation is a terminal-based prototype using Python's `curses` library.

The application should eventually support two rendering backends:

1. A terminal renderer using Japanese and ASCII characters.
2. A physical LED renderer communicating with an ESP32 controller.

Both should consume the same underlying animation model.

## 1.2 Physical installation

The initial hardware specification is:

| Property | Specification |
|---|---|
| Acoustic panels | Vertical wooden slats |
| Gap between slats | 10 mm |
| Panel height | 240 cm |
| LED strips | 30 |
| Length per LED strip | 1 metre |
| LEDs per strip | 60 |
| Total LEDs | 1,800 |
| LED colour | Green only |
| Controller | ESP32, provisional |
| Host | Linux desktop |
| Data source | Linux kernel activity |

The 30 × 60 grid represents the proposed LED installation.

The original 240 cm panel height does not mean that every gap must contain a full-height LED strip. The current simulation models 1-metre strips.

The final placement of those strips within the acoustic panels remains undecided.

## 1.3 Intended users

The primary user is an experienced Linux developer with a background in functional programming and quantitative engineering.

The code should therefore be:

- Educational and technically rigorous.
- Readable and well documented.
- Modular and testable.
- Suitable for experimentation with Linux internals.
- Extensible toward eBPF and embedded hardware.

The Python implementation is intentionally written as an executable tutorial, with numbered sections explaining its construction.

## 1.4 Fundamental design principle

**The rain must represent actual Linux activity, not merely random visual effects.**

This requirement has evolved through several iterations:

1. Random falling streams.
2. Randomly mutating characters.
3. Mutations derived deterministically from `/proc` telemetry.
4. Mutations driven by actual eBPF scheduling events.

The fourth stage is implemented experimentally.

Randomness remains acceptable for decorative aspects such as initial stream spawning and movement variation.

However, character mutation must remain tied to observed system information.

---

# 2. Current Implementation Status

## 2.1 Implemented features

| Feature | Status |
|---|---|
| 30 × 60 simulation grid | Implemented |
| Falling rain streams | Implemented |
| Green terminal rendering | Implemented |
| Bright leading characters | Implemented |
| Fading trails | Implemented |
| Katakana characters | Implemented |
| Hiragana characters | Implemented |
| Kanji characters | Implemented |
| ASCII characters | Implemented |
| Independent tail-character mutation | Implemented |
| `/proc` telemetry collection | Implemented |
| Adaptive activity baselines | Implemented |
| Deterministic telemetry-derived glyphs | Implemented |
| eBPF `sched_switch` collection | Implemented; runtime unverified |
| eBPF-driven glyph mutation | Implemented; runtime unverified |
| Bounded eBPF event queue | Implemented |
| `--fill` terminal sizing | Implemented; needs testing |
| Live terminal resizing | Implemented; needs testing |
| Pause/resume | Implemented |
| Baseline reset | Implemented |
| Configurable frame rate | Implemented |
| Configurable telemetry polling | Implemented |
| Physical LED output | Not implemented |
| ESP32 communication | Not implemented |
| Automated tests | Not present |

## 2.2 Current data flow

```text
                 Linux Kernel
                      |
          +-----------+-----------+
          |                       |
       procfs                   eBPF
          |                       |
          v                       v
   LinuxTelemetry         SchedulerCollector
          |                       |
          |                 sched_switch
          |                       |
          v                       v
   AdaptiveBaseline       ScheduleEvent queue
          |                       |
          +-----------+-----------+
                      |
                      v
                RainSimulation
                      |
                      v
                  pixels()
                      |
                      v
                curses renderer
                      |
                      v
                Linux terminal
```

The program currently supports two data-source modes:

- `proc`: aggregated Linux statistics.
- `ebpf`: actual scheduling events, plus procfs statistics for animation intensity.

In `ebpf` mode, scheduler events drive glyph mutation. Procfs remains responsible for activity measurements used by the rain engine.

---

# 3. Requirements and Constraints

## 3.1 Functional requirements

The simulator must:

1. Display independently animated vertical columns.
2. Support 30 columns and 60 rows by default.
3. Support arbitrary terminal dimensions through `--fill`.
4. Respond to changes in actual Linux activity.
5. Mutate characters throughout the entire trail, not just at the head.
6. Support Katakana, Hiragana, Kanji and ASCII glyphs.
7. Use deterministic event-to-glyph mappings.
8. Continue animating between telemetry samples.
9. Allow the user to pause, quit and reset learned baselines.
10. Preserve the separation between data collection, animation and rendering.

## 3.2 Performance requirements

Current defaults:

```text
columns                 30
rows                    60
fps                     30
poll                    0.2 seconds
max-events-per-frame    4096
source                  proc
```

The design should avoid blocking the rendering loop on kernel event collection.

The animation should remain smooth during compilation, downloads and other high-activity workloads.

A future physical renderer should support approximately 30–60 FPS.

## 3.3 Security requirements

The `/proc` mode must operate without root privileges.

eBPF tracing may require elevated privileges, depending on kernel configuration.

The collector currently captures:

```text
timestamp_ns
cpu
prev_pid
next_pid
```

It does not collect process names, command-line arguments or file contents.

Future versions should preserve this privacy-conscious approach unless additional information is explicitly needed.

Prefer running the terminal application without root, with privileged tracing isolated in a separate collector process.

## 3.4 Hardware constraints

The future LED system must accommodate:

- 10 mm slat gaps.
- Monochrome green lighting.
- Thirty independent vertical channels.
- Sixty individually controllable positions per channel.
- A Linux desktop supplying live telemetry.
- An ESP32 or comparable embedded controller.

The physical LED implementation must not depend on Unicode glyph rendering.

The terminal uses characters to represent individual pixels; the LED installation will use brightness values.

---

# 4. Important Design and Technical Decisions

## 4.1 Python and curses

The prototype uses Python 3 and the standard-library `curses` module.

Reasons:

- No graphical desktop framework required.
- Direct access to terminal dimensions.
- Efficient character-based rendering.
- Simple keyboard interaction.
- Convenient Linux `/proc` integration.
- Accessible tutorial implementation.

No third-party Python packages are required in `proc` mode.

The eBPF collector requires BCC Python bindings.

## 4.2 Separation of simulation and rendering

The central abstraction is:

```python
class RainSimulation:
    def step(self, dt, intensity):
        ...

    def apply_telemetry(self, telemetry):
        ...

    def apply_schedule_events(self, events):
        ...

    def pixels(self):
        ...
```

The renderer consumes:

```python
grid[row][column] = (glyph, brightness_tier)
```

Brightness tiers currently range from 0 to 3.

This separation was chosen to make future hardware integration possible without rewriting the animation logic.

A future version should probably introduce a more explicit frame abstraction.

## 4.3 Persistent character state

Each falling stream is represented by:

```python
@dataclass
class Drop:
    head: float
    speed: float
    glyphs: list[str]

    @property
    def length(self):
        return len(self.glyphs)
```

The `glyphs` list stores persistent character state.

This is essential because characters already present in the fading tail must be able to mutate independently.

The animation does not simply generate a new character when the stream head advances.

## 4.4 Adaptive Linux telemetry

The program reads cumulative kernel counters and calculates rates from consecutive observations.

Important sources:

| Source | Measurement |
|---|---|
| `/proc/stat` | CPU utilisation |
| `/proc/stat` | Context switches |
| `/proc/stat` | Process/thread creation |
| `/proc/diskstats` | Disk read/write sectors |
| `/proc/net/dev` | Network traffic |

The current implementation does not actually sample `/proc/pressure/memory`, despite earlier project discussions and README statements suggesting otherwise.

This discrepancy should be corrected.

The `AdaptiveBaseline` class implements exponentially weighted mean and variance.

Its learning timescale defaults to 45 seconds.

The smoothing coefficient is:

\[
\alpha = 1-e^{-\Delta t/\tau}
\]

where:

- \(\Delta t\) is elapsed time.
- \(\tau\) is the adaptation timescale.

The observed values are log-transformed before baseline comparison:

```python
baseline.observe(math.log1p(rate), dt)
```

This compresses large spikes and makes the visualisation less sensitive to absolute hardware performance.

This is adaptive statistical normalisation, not machine learning in the conventional sense.

## 4.5 Deterministic character mutation

Random character mutation was explicitly rejected.

The current `/proc` implementation uses BLAKE2s to derive glyph changes from telemetry.

Relevant code:

```python
payload = (
    f'{channel}:{delta}:{cumulative}:'
    f'{telemetry.sample_index}:{x}:'
    f'{drop_number}:{distance}'
).encode('ascii')

digest = hashlib.blake2s(
    payload,
    digest_size=8
).digest()

value = int.from_bytes(digest, 'big')
```

The resulting value determines whether a character changes and which replacement glyph appears.

This ensures that mutation depends on measured information.

However, the mapping is not reversible and does not preserve the complete source event.

It is a visual encoding, not a lossless observability format.

Also note that including `sample_index` means reproducibility depends on the sampling sequence, not merely on the underlying kernel counter values.

## 4.6 eBPF event collection

The optional collector uses BCC and the scheduler tracepoint:

```text
sched:sched_switch
```

The BPF program captures:

```c
struct event_t {
    u64 timestamp_ns;
    u32 cpu;
    u32 prev_pid;
    u32 next_pid;
};
```

It uses:

```c
BPF_PERF_OUTPUT(events);
```

and:

```c
TRACEPOINT_PROBE(sched, sched_switch)
```

The Python collector reads events using:

```python
self.bpf.perf_buffer_poll(timeout=100)
```

The collector runs in a background thread.

Events are stored in a bounded `deque`.

This design prevents unbounded Python memory growth, but it does not prevent high event-production overhead in the kernel.

## 4.7 Mapping scheduling events to glyphs

The current implementation uses:

```python
x = (
    event.cpu * 7 + event.next_pid
) % self.columns
```

The selected drop is:

```python
drop = drops[
    event.next_pid % len(drops)
]
```

The selected character position is:

```python
distance = (
    event.prev_pid
    ^ event.next_pid
    ^ (event.timestamp_ns >> 12)
) % drop.length
```

The replacement glyph is derived using BLAKE2s.

This is deterministic for the same event and simulation state.

However, it does **not** assign a stable column to each CPU core.

The next major improvement should make the relationship between kernel events and physical columns more interpretable.

## 4.8 Terminal sizing

The `--fill` option uses:

```python
height, width = stdscr.getmaxyx()

columns = max(
    1,
    (width - 1) // 2
)

rows = max(
    1,
    height - 2
)
```

Two terminal character cells are allocated per simulated column because Japanese characters are generally double-width.

Two terminal lines are nominally reserved for status and controls.

Terminal resizing calls:

```python
rain.resize(columns, rows)
```

Existing streams in surviving columns are preserved.

There is currently an inconsistency between the grid-sizing calculation and the renderer's visible-row calculation. See Section 7.

---

# 5. Repository and File Structure

The current project is a small directory, not a fully established version-controlled repository.

```text
kernel_rain/
├── kernel_rain.py
├── ebpf_events.py
└── README.md
```

A ZIP archive also exists:

```text
kernel_rain.zip
```

## 5.1 `kernel_rain.py`

**Primary application and tutorial.**

Contains the following important components:

| Component | Responsibility |
|---|---|
| `GLYPHS` | Character-set definitions |
| `CHANNELS` | Telemetry channel names |
| `clamp()` | Numeric intensity limiting |
| `read_kernel_counters()` | Linux procfs collection |
| `AdaptiveBaseline` | Rolling statistical baseline |
| `LinuxTelemetry` | Rates and activity intensity |
| `Drop` | Falling-stream state |
| `RainSimulation` | Animation and glyph mutation |
| `draw()` | curses renderer |
| `run()` | Main event loop |
| `main()` | CLI argument parsing |

Important API signatures:

```python
read_kernel_counters()

AdaptiveBaseline.observe(value, elapsed)

LinuxTelemetry.sample()

RainSimulation.resize(columns, rows)

RainSimulation.step(dt, intensity)

RainSimulation.apply_telemetry(telemetry)

RainSimulation.apply_schedule_events(events)

RainSimulation.pixels()

draw(
    stdscr,
    simulation,
    telemetry,
    paused,
    ebpf_status=""
)

run(stdscr, args)

main()
```

The source is divided into ten educational sections, from imports and Linux telemetry through animation, curses and CLI setup.

Preserve the tutorial character of the file during refactoring, or move the explanations into a dedicated tutorial document.

## 5.2 `ebpf_events.py`

**Optional Linux scheduler-event collector.**

Important components:

```python
BPF_PROGRAM
ScheduleEvent
SchedulerCollector
```

Event structure:

```python
@dataclass(frozen=True)
class ScheduleEvent:
    timestamp_ns: int
    cpu: int
    prev_pid: int
    next_pid: int
```

Collector interface:

```python
collector = SchedulerCollector(
    max_events=8192
)

events, lost = collector.drain(
    max_items=4096
)

collector.close()
```

The collector also exposes:

```python
collector.error
```

The queue is protected by a threading lock.

The background polling thread is a daemon thread.

The `lost` counter includes both application queue overflow and perf-buffer loss.

## 5.3 `README.md`

Contains:

- Project overview.
- Basic run instructions.
- Unicode terminal requirements.
- Telemetry mapping.
- eBPF installation.
- Data-driven mutation explanation.
- `--fill` usage.
- Current limitations.

The README needs correction regarding memory PSI sampling.

## 5.4 Recommended future structure

A useful next-stage layout would be:

```text
kernel-rain/
├── README.md
├── pyproject.toml
├── src/
│   └── kernel_rain/
│       ├── __init__.py
│       ├── cli.py
│       ├── telemetry.py
│       ├── baselines.py
│       ├── simulation.py
│       ├── glyphs.py
│       ├── events.py
│       ├── ebpf_events.py
│       ├── renderers/
│       │   ├── __init__.py
│       │   ├── curses.py
│       │   └── led.py
│       └── protocols/
│           └── esp32.py
├── tests/
│   ├── test_baselines.py
│   ├── test_simulation.py
│   ├── test_event_mapping.py
│   └── test_terminal_geometry.py
└── docs/
    ├── tutorial.md
    ├── architecture.md
    └── hardware.md
```

This is a proposed structure, not the current repository.

---

# 6. Setup and Run Commands

## 6.1 Requirements

- Linux.
- Python 3 with `curses`.
- UTF-8 terminal.
- Terminal font supporting Japanese Unicode characters.
- Optional BCC installation for eBPF.

The application is designed primarily for Ubuntu.

## 6.2 Basic execution

```bash
cd kernel_rain

python3 kernel_rain.py
```

Default configuration:

```bash
python3 kernel_rain.py \
    --columns 30 \
    --rows 60 \
    --fps 30 \
    --poll 0.2 \
    --source proc
```

## 6.3 Automatic terminal sizing

```bash
python3 kernel_rain.py --fill
```

The `--fill` option overrides the configured column and row counts.

The simulation checks terminal dimensions during animation.

## 6.4 Character selection

All character sets:

```bash
python3 kernel_rain.py \
    --glyphs katakana,hiragana,kanji,ascii
```

Katakana only:

```bash
python3 kernel_rain.py \
    --glyphs katakana
```

ASCII only:

```bash
python3 kernel_rain.py \
    --glyphs ascii
```

## 6.5 eBPF dependencies

On Ubuntu/Debian:

```bash
sudo apt update

sudo apt install \
    python3-bpfcc \
    bpfcc-tools \
    linux-headers-$(uname -r)
```

The exact packages depend on the installed distribution and kernel.

BCC Python bindings may be available through `/usr/bin/python3` but not through a virtual environment.

Verify with:

```bash
/usr/bin/python3 -c "from bcc import BPF; print('BCC OK')"
```

## 6.6 eBPF execution

```bash
sudo /usr/bin/python3 kernel_rain.py \
    --source ebpf \
    --columns 30 \
    --rows 60 \
    --fps 30
```

With automatic terminal sizing:

```bash
sudo /usr/bin/python3 kernel_rain.py \
    --source ebpf \
    --fill \
    --fps 30
```

Running curses applications through `sudo` may affect locale and terminal configuration.

A future implementation should separate the privileged collector from the unprivileged renderer.

## 6.7 CLI options

| Option | Default | Purpose |
|---|---|---|
| `--fill` | Disabled | Automatic terminal sizing |
| `--columns` | `30` | Number of simulated strips |
| `--rows` | `60` | LEDs per strip |
| `--fps` | `30` | Target animation FPS |
| `--poll` | `0.2` | Procfs polling interval |
| `--glyphs` | All four sets | Character selection |
| `--source` | `proc` | `proc` or `ebpf` |
| `--max-events-per-frame` | `4096` | eBPF processing limit |
| `--seed` | None | Reproducible simulation randomness |

## 6.8 Keyboard controls

| Key | Action |
|---|---|
| `q` | Quit |
| Escape | Quit |
| Space | Pause/resume |
| `r` | Reset adaptive baselines |

## 6.9 Syntax validation

```bash
python3 -m py_compile \
    kernel_rain.py \
    ebpf_events.py
```

This checks Python syntax only.

It does not validate eBPF compilation, attachment or runtime behaviour.

---

# 7. Known Bugs, Limitations and Unfinished Work

## 7.1 Terminal height inconsistency

**Priority: High**

In `--fill` mode:

```python
rows = max(1, height - 2)
```

However, `draw()` uses:

```python
visible_rows = min(
    simulation.rows,
    height - 3
)
```

Consequently, the simulator allocates one more logical row than the renderer displays.

The correct policy should be chosen explicitly.

For example, reserve two status rows and render all remaining rows:

```python
visible_rows = min(
    simulation.rows,
    height - 2
)
```

Also verify the bottom-right terminal-cell handling.

## 7.2 Incomplete small-terminal handling

**Priority: High**

The renderer has a size warning, but very small terminal dimensions may still cause curses errors when writing status lines.

Test:

- One-line terminals.
- Very narrow terminals.
- Rapid terminal resizing.
- Full-width Unicode characters at the right edge.

## 7.3 eBPF runtime is unverified

**Priority: High**

The Python implementation has previously passed syntax checks.

However, actual BPF compilation and attachment have not been verified on the target Ubuntu kernel.

Potential issues include:

- Missing BCC bindings.
- Kernel tracing restrictions.
- Unsupported tracepoint definitions.
- Kernel lockdown settings.
- Perf-buffer loss.
- Insufficient privileges.

The next agent should validate the collector against the user's actual environment.

## 7.4 High scheduler-event volume

**Priority: High**

The eBPF collector emits one record per `sched_switch`.

On a busy multicore system, this can produce substantial event traffic.

The current queue is bounded:

```python
deque(maxlen=8192)
```

And processing is limited:

```text
--max-events-per-frame 4096
```

However, this does not eliminate kernel-side event generation overhead.

A production version should aggregate events inside eBPF maps or apply kernel-side sampling.

## 7.5 Event loss reporting

**Priority: Medium**

`SchedulerCollector.drain()` returns a loss count accumulated since the previous drain.

The UI displays this as:

```text
dropped N
```

This is not a cumulative loss total.

A cumulative total and loss rate would be more informative.

## 7.6 Event-to-column mapping is not interpretable

**Priority: High**

Current mapping:

```python
x = (
    event.cpu * 7 + event.next_pid
) % self.columns
```

This distributes events across columns but does not establish stable CPU ownership.

Consequently, the wall cannot currently be interpreted as one column per core.

A configurable mapping strategy is needed.

## 7.7 Telemetry and rendering are not fully decoupled

**Priority: Medium**

The application has separate classes, but the main curses loop still coordinates sampling, simulation and rendering directly.

The next architecture should support independent collectors and output devices.

## 7.8 Memory pressure is not implemented

**Priority: Medium**

The README mentions `/proc/pressure/memory`.

The actual `read_kernel_counters()` function does not read this file.

Memory PSI is not currently displayed or mapped to rain behaviour.

This is unfinished functionality, not an implemented feature.

## 7.9 Disk telemetry limitations

**Priority: Medium**

The disk collector recognises selected whole-device names:

```python
whole_nvme = (
    name.startswith('nvme')
    and 'p' not in name
)

whole_sd = (
    name.startswith(('sd', 'vd', 'xvd'))
    and name[-1].isalpha()
)
```

This is heuristic.

It can miss some device classes and does not robustly distinguish all physical and virtual block devices.

The collector also assumes 512-byte sector units.

Improve device discovery and document the exact interpretation of disk counters.

## 7.10 Character mutation is not a lossless encoding

**Priority: Low**

BLAKE2s creates a deterministic visual representation.

However:

- The original event cannot be reconstructed.
- Multiple events may map to the same character.
- Multiple events may update the same cell within one frame.
- The displayed character depends on the current animation state.

This is acceptable for an artistic observability display.

It should not be presented as a forensic event log.

## 7.11 Pause semantics are incomplete

**Priority: Medium**

In eBPF mode, the event queue continues to be drained while paused.

Those events are discarded rather than replayed after resuming.

Procfs telemetry also continues to update.

This means pause freezes the visual animation, not the underlying data collection.

That behaviour should be documented or made configurable.

## 7.12 CPU and telemetry limitations

**Priority: Medium**

CPU utilisation is calculated from aggregate `/proc/stat` counters.

The implementation does not currently provide per-core utilisation.

Process creation uses the `processes` counter and should not be described as executable launches.

Network statistics represent interfaces in the current network namespace.

## 7.13 Brightness representation

**Priority: Low**

The current model uses four brightness tiers:

```text
0 = off
1 = dim
2 = medium
3 = bright
```

The brightest tier is rendered using terminal white.

The physical LED backend will need a more precise brightness representation, probably an integer from 0 to 255.

## 7.14 No automated test suite

**Priority: High**

There are no automated tests for:

- Baseline calculations.
- Telemetry counter differences.
- Deterministic glyph generation.
- Event-to-column mapping.
- Stream lifecycle.
- Terminal resizing.
- Event queue overflow.
- Rendering geometry.

Tests should not require root privileges or a running eBPF collector.

## 7.15 Physical hardware integration

**Status: Not started**

Missing components include:

- ESP32 firmware.
- Host-to-controller protocol.
- LED frame encoder.
- Physical column mapping.
- Brightness calibration.
- Power budgeting.
- Connection recovery.
- Hardware safety mechanisms.

---

# 8. Next Five Concrete Tasks

## Task 1 — Fix terminal sizing and add automated tests

**Priority: P0**

Make terminal geometry correct and testable.

Actions:

1. Extract terminal-size calculations into a pure function.
2. Define the exact number of reserved status rows.
3. Fix the `height - 2` versus `height - 3` inconsistency.
4. Handle very small terminals safely.
5. Add tests for Unicode width, grid resizing and stream preservation.

Acceptance criteria:

- `--fill` uses the intended drawable area.
- No uncaught curses errors during supported resizing scenarios.
- Existing rain streams survive ordinary terminal resizing.
- Tests run without eBPF or root privileges.

## Task 2 — Validate and harden the eBPF collector

**Priority: P0**

Verify real scheduling-event collection.

Actions:

1. Confirm BCC compatibility with the target kernel.
2. Attach to `sched:sched_switch`.
3. Verify CPU, PID and timestamp values.
4. Measure event throughput.
5. Measure perf-buffer loss and queue overflow.
6. Add kernel-side aggregation or sampling if necessary.
7. Provide a clear fallback when eBPF is unavailable.

Acceptance criteria:

- Real events can be observed.
- Event loss is measured.
- The terminal remains responsive during heavy CPU activity.
- The collector shuts down cleanly.
- Failure modes are documented.

## Task 3 — Introduce meaningful CPU-to-column mapping

**Priority: P1**

Replace the current mixed hash mapping with configurable visual semantics.

Suggested strategies:

```text
hash
per_cpu
per_cpu_group
process_group
activity_weighted
```

For `per_cpu`, a simple initial mapping is:

```python
column = event.cpu % columns
```

If there are more CPU cores than columns, multiple cores share columns.

If there are fewer CPU cores than columns, each core can own multiple columns.

A more sophisticated mapping should preserve stable core identity and distribute events across each core's assigned columns.

Acceptance criteria:

- Column ownership is deterministic.
- CPU activity has a recognisable spatial relationship.
- Mapping works with different CPU counts.
- Mapping strategy is configurable.

## Task 4 — Refactor telemetry, simulation and rendering interfaces

**Priority: P1**

Prepare for the ESP32 backend without implementing hardware yet.

Introduce explicit interfaces such as:

```python
class TelemetrySource:
    def poll(self):
        ...

class RainEngine:
    def update(self, dt, events, metrics):
        ...

    def frame(self):
        ...

class Renderer:
    def render(self, frame):
        ...
```

These are proposed interfaces, not existing APIs.

Separate:

- Kernel collection.
- Event normalisation.
- Activity interpretation.
- Rain simulation.
- Glyph rendering.
- LED brightness rendering.

Acceptance criteria:

- The simulation can run without curses.
- Synthetic event streams can drive tests.
- Terminal rendering consumes a generic frame.
- Future LED rendering does not require glyph logic.

## Task 5 — Implement a simulated ESP32 LED output backend

**Priority: P2**

Create a host-side backend that converts the simulation into 30 × 60 monochrome brightness values.

Initial output format:

```text
30 columns
60 pixels per column
8-bit brightness
1,800 bytes per frame
```

At 30 FPS, raw brightness data is:

\[
1800 \times 30 = 54{,}000\text{ bytes/s}
\]

This excludes packet headers and transport overhead.

At 60 FPS:

\[
1800 \times 60 = 108{,}000\text{ bytes/s}
\]

These rates are manageable for a local network, although transport reliability and controller timing must still be considered.

Start with a simulated receiver rather than physical hardware.

Acceptance criteria:

- A deterministic 30 × 60 brightness frame is produced.
- Terminal and LED renderers can consume the same animation state.
- Frame ordering is defined.
- The protocol supports sequence numbers.
- Dropped frames do not cause the receiver to stall.

---

# 9. Assumptions and Unresolved Questions

## 9.1 Physical installation

The following remain undecided:

- Whether all 30 strips will be installed in adjacent gaps.
- Whether strips occupy the upper, middle or lower metre of the 2.4 m panels.
- Whether individual LED dots or diffused segments are preferred.
- Whether monochrome addressable LEDs or RGB strips restricted to green will be used.
- Exact ESP32 model.
- Final power-supply architecture.

These decisions should not block terminal simulation development.

## 9.2 CPU mapping

The number of logical CPU cores on the target desktop is unknown.

Determine this using:

```bash
nproc
```

And:

```bash
lscpu
```

The number of cores will influence how scheduling activity maps onto 30 columns.

## 9.3 Event semantics

Should the wall primarily represent:

1. CPU scheduling activity?
2. Process creation and execution?
3. Disk and network activity?
4. A combination of all system activity?

The current design uses a combination.

The next version should make these mappings configurable rather than hard-coded.

## 9.4 Determinism

The user explicitly wants mutations tied to actual information.

One unresolved design choice is whether the entire animation should be reproducible from a recorded event stream.

Currently, stream spawning and initial glyphs remain pseudorandom.

A fixed `--seed` makes these choices reproducible only when event timing and simulation stepping are also reproduced.

A future replay mode would be useful for debugging.

## 9.5 Deployment model

The final installation will probably need:

```text
Linux collector
      |
      v
Animation engine
      |
      v
Frame encoder
      |
      v
Local network
      |
      v
ESP32
      |
      v
30 LED strips
```

However, an alternative architecture is:

```text
Linux collector
      |
      v
Compact telemetry stream
      |
      v
ESP32 animation engine
      |
      v
LED strips
```

The earlier project discussions favoured local animation on the ESP32.

That approach reduces network bandwidth and allows the display to continue operating when the desktop disconnects.

The final decision should be made after measuring ESP32 memory, rendering performance and required animation complexity.

## 9.6 Data collection permissions

Running the complete curses application with `sudo` is acceptable for early experiments but undesirable for long-term deployment.

Prefer a separate collector process with the minimum privileges required by the kernel.

The communication interface between collector and renderer is not yet designed.

## 9.7 Recording and replay

There is no recording or replay system.

A future version should support:

```text
live telemetry
recorded telemetry
synthetic telemetry
```

This would enable deterministic tests, benchmarking and visual tuning without requiring privileged kernel access.

---

# 10. Guidance for the Next Coding Agent

**Preserve the central project requirement: this is a visualisation of real Linux activity, not a generic Matrix screensaver.**

The existing implementation is deliberately educational.

Avoid replacing it with a complex framework before establishing tests and validating eBPF behaviour.

Recommended engineering principles:

- Keep telemetry collection independent of rendering.
- Use monotonic time for animation and sampling.
- Preserve deterministic event-derived glyph mutation.
- Keep eBPF queues bounded.
- Avoid expensive per-event Python processing at very high scheduler rates.
- Make CPU-to-column mapping explicit.
- Keep privileged operations isolated.
- Maintain an unprivileged `/proc` fallback.
- Preserve support for Unicode Japanese characters.
- Make the future LED backend independent of glyph identity.
- Add tests before major refactoring.

The first priority is **correctness and observability**, followed by architectural separation and hardware integration.

## Definition of success

The next milestone is complete when the simulator:

1. Reliably fills and resizes with the terminal.
2. Reacts to real Linux scheduling activity.
3. Provides an interpretable relationship between CPU activity and rain columns.
4. Mutates characters throughout the trails using actual kernel information.
5. Can produce deterministic monochrome brightness frames independently of curses.

At that point, the project will be ready for a first ESP32 hardware prototype.
