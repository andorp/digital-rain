# Hand optimization notes

This round starts from the committed GCC `-O3` listing, `optimized.s`.
I copied that file to `hand_optimized.s` and edited the assembly directly.
I did **not** run GCC in this round. GNU `as` assembled the edited listing,
and GNU `ld` linked `kernel_rain_hand` with the system C runtime, ncursesw,
libm, and libc.

## First hand pass: integer logarithms

Two paths inside `rain_sync` calculate a drop's target trail length:
the path for an existing drop and the path for a newly discovered one.
Both used two libm `log2` calls:

```text
memory contribution = floor(log2(rss_pages + 1) / 2)
thread contribution = floor(log2(max(1, threads)))
```

For nonnegative integer values in the normal range, the integer part of
`log2(n)` is the index of its highest set bit. x86-64 `bsrq` finds that bit.
The hand edit uses `bsrq` in each path, shifts the memory result right once,
and keeps the rest of the target-length calculation unchanged. The edit is
annotated with `Hand pass 1` and `Hand pass 2` inside `hand_optimized.s`.

The fast path applies below `2^40`. Larger values use the original libm
sequence, preserving its floating-point rounding and avoiding a change to
unusual counter values. Zero thread counts produce the same zero contribution
as `log2(1)`. Real procfs RSS and thread counts are ordinarily far below the
fallback threshold.

## Second hand pass: scalar clamps

`record_history` normalized several CPU, I/O, and memory signals to the
interval `[0, 1]`. GCC emitted calls to `fmin` and `fmax` for these clamps.
I replaced those calls with SSE2 `minsd` and `maxsd` instructions, using the
same constants in `%xmm1`. I also replaced the corresponding calls in the
per-process `rain_sync` path, including the elapsed-time floor and the
sustained-activity calculation. The edit is marked `Hand pass 3` and
`Hand pass 4` in `hand_optimized.s`.

These inputs are finite: elapsed time has a positive floor, process counters
are integers, and the command-line poll interval is checked for finiteness.
For the observed numeric range, the scalar instructions give the same clamp
results while avoiding repeated calls through the libm function table. I
kept `log1p`, `round`, and unrelated presentation code unchanged; their
replacement would need separate numerical and performance evidence.

## Why these paths

The process-sync loop runs once per live process at every sample. A library
call there costs more than one bit-scan instruction, especially when the
calculation needs only the integer portion of a logarithm. Unlike a glyph
rendering change, this optimization does not depend on terminal size or
font behavior.

The four `log2` call sites remain visible in the listing because they are
still needed by the rare large-value fallbacks. On the usual path they are
skipped. The clamp edits target code that also runs once per process per
sample. This makes both changes relevant to the sync benchmark, while their
effect on the full curses program remains dependent on procfs and rendering.

## Build without GCC

```sh
make hand check-hand benchmark-hand
./kernel_rain_hand --fill
```

The `hand` target invokes only `as` and `ld`. Its linker paths are for
Debian/Ubuntu x86-64. The original `optimized.s` and binary are kept so you
can compare them. Regenerating `optimized.s` is unnecessary for this hand
edit and would invoke GCC via the older Makefile target.

## Checks and measurement

All versions returned `drops=4096` in the headless sync benchmark. The first
pass, compared with GCC's original listing in five alternating runs, gave:

| Assembly | Sorted times (seconds) | Median |
|---|---|---:|
| Original `optimized.s` | 0.006317, 0.006389, 0.006539, 0.006720, 0.007430 | 0.006539 |
| Bit-scan pass only | 0.005854, 0.005949, 0.005964, 0.005964, 0.008174 | 0.005964 |

The median elapsed time fell about **8.8%**. The second pass was tested in
two steps: clamps in `record_history`, then the remaining hot clamps in
`rain_sync`. Each passed the self-test and reduced the paired median. A final
five-run comparison of the bit-scan-only binary with both passes gave:

| Assembly | Sorted times (seconds) | Median |
|---|---|---:|
| Bit-scan only | 0.005945, 0.005992, 0.006015, 0.006207, 0.006276 | 0.006015 |
| Bit-scan + SSE2 clamps | 0.005230, 0.005236, 0.005244, 0.005366, 0.006235 | 0.005244 |

That is **12.8% less median elapsed time** than the bit-scan-only version in
this run. One SSE2 run was slower than the previous median, so repeat the
benchmark on your own machine. The benchmark excludes procfs reads and
terminal drawing; it is not a frame-rate claim.

`make check-hand` passed the existing queue, hash-index, and PID-reuse tests.
The final live curses display started and quit cleanly. A separate check compared
the bit-scan formulas with `math.log2` at 20,130 small, boundary, and random
values below `2^40`.
