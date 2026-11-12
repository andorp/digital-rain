# Kernel Rain in C

This is a Linux C11 port of the default procfs mode of the Python Kernel Rain
tutorial. Each stream represents a `(PID, start time)` process identity. Six
characters nearest its head show its current state, CPU, memory, storage I/O,
threads, and system pressure. The rest record recent activity. The source is
one file so you can read its numbered sections in execution order.

## Build and run

Install a C compiler, `make`, and the **wide-character ncurses development
package** (`libncurses-dev` on Debian/Ubuntu). No third-party runtime
packages or root privileges are needed.

```sh
make
make check
./kernel_rain
./kernel_rain --fill --glyphs katakana,hiragana,kanji,ascii
```

Use a UTF-8 locale and a terminal font with Japanese characters. The default
grid is 30 columns by 60 rows and needs at least 61 terminal cells of width
and 63 lines. `--fill` uses `(terminal width - 1) / 2` columns and reserves
two lines for status. It responds to terminal resizing. Run
`./kernel_rain --help` for the remaining options.

Press **q** or Escape to quit, **Space** to pause, and **r** to reset sampling
and learned baselines. Sampling continues while paused. The display uses
`/proc/stat`, `/proc/diskstats`, `/proc/net/dev`, `/proc/pressure`,
`/proc/<pid>/stat`, and, when readable, `/proc/<pid>/io`. CPU temperature is
read from recognized hwmon sensors when available.

The C version implements the procfs source. The Python tutorial's optional
BCC/eBPF scheduler collector is not part of this build; `--source ebpf` exits
with an explicit error. The C source is read-only with respect to procfs and
does not need kernel tracing privileges.

## Reading the tutorial

The numbered sections in `main.c` progress from data structures through
procfs parsing, rates and adaptive baselines, process sampling, semantic
glyphs, queue simulation, rendering, and the main loop. `make check` runs
headless checks for the two subtle queue cases: an exited stream releases its
column once invisible, and expanding the terminal distributes waiting streams
without moving the visible stream.

The display is a visual summary, not a process monitor or a lossless event
log. Some process I/O files are inaccessible to unprivileged users; those
streams show the unknown I/O symbol. Disk throughput covers common whole
NVMe, SATA, and virtio devices, and network totals reflect the current
network namespace. A process that exits between samples may never appear.
