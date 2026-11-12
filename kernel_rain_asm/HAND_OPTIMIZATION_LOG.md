# Hand optimization notes

The first two hand passes started from the original committed GCC `-O3`
listing, `optimized.s`. I copied it to `hand_optimized.s` and edited the
assembly directly. Those passes used GNU `as` and `ld`, without GCC. A later
C-first pass regenerated `optimized.s` and then applied fresh hand edits;
that pass is documented at the end of this log.

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

## Follow-up: seven more assembly candidates

I tried the seven ideas from the subsequent review directly in
`hand_optimized.s`. The retained edits have comments beginning `Experiment`.
This pass again used only GNU `as` and `ld` to build the executable.

| Candidate | Decision | Reason and correctness boundary |
|---|---|---|
| 1. CPU-tick divisor | Kept | `clock_ticks` is fixed during a sync, so `lround(clock_ticks / 10)` now runs once before the process loop. For the common divisor 10, an exact unsigned reciprocal multiply replaces `divq`; other divisors retain `divq`. The reciprocal was checked on 100,006 boundary and random 64-bit inputs. |
| 2. Inline `round` | Discarded | Two exact half-away sequences passed the self-test but did not improve paired sync timings. The final listing retains libm `round`. |
| 3. Zero I/O | Kept | When `read_delta + write_delta` is zero, the code produces the exact `log1p(0) = 0` result without calling libm. Nonzero values use the original path. |
| 4. Semantic CPU denominator | Kept | One remaining `fmax` call became scalar SSE2 `maxsd`; its operands are finite and the positive floor remains the source operand. |
| 5. Glyph-form remainder | Kept | Four enabled scripts now use the low two bits instead of `divq` in history selection and instead of `idivl` on heartbeat form changes. Other script counts retain division. |
| 6. Heartbeat remainder | Kept | If accumulated progress is below twice the cadence, one subtraction gives the exact remainder. Larger bursts retain `divq`. |
| 7. History shift | Kept | The overlapping `memmove` of at most nine glyph pointers became a bounded backward copy. The six semantic positions and history order stay the same. |

These are *combined* benchmark results; the short runs and changing system
load do not establish a reliable speedup for each edit in isolation. Ten
alternating `--benchmark-sync` runs per version on this machine yielded a
median of **0.005721 s** for the previously committed hand assembly and
**0.004905 s** for this version, about **14.3% less elapsed time**. Both
returned `drops=4096`. The benchmark uses ASCII glyphs, so the four-script
remainder fast path is outside that timing. Live runs with four and three
enabled scripts started and quit cleanly.

The existing self-test passed after each retained edit and after the final
rebuild. The benchmark excludes procfs reads and terminal drawing; the result
does not imply an equivalent change in displayed frame rate. No C source or
GCC-generated listing was changed during this pass.

## C-first pass and new hand assembly

The previous experiments exposed repeated work that belongs in C, where its
meaning is easier to check. `main_optimized.c` now computes the tick step,
CPU denominator, I/O elapsed floor, decay factor, glyph-form count, and
pressure level once per sync. It computes each process's CPU fraction once
and passes it to semantic classification, trail adjustment, history scoring,
and speed selection. The integer part of the length logarithms uses
`__builtin_clzll` below `2^40`, with the original libm path above that
threshold. Zero I/O skips `log1p(0)`, and a heartbeat crossing only one
cadence uses subtraction, retaining modulo for large bursts. The C history
shift already expressed a bounded backwards copy.

I rebuilt `optimized.s` with the Makefile's original GCC `-O3` flags, then
copied that fresh listing to `hand_optimized.s` and edited it manually. The
current hand file contains these changes on top of the new compiler output:

| Hot path | Hand change | Why and boundary |
|---|---|---|
| History score and trail clamps | Replace selected libm `fmin`/`fmax` calls with SSE2 `minsd`/`maxsd` | Inputs on these paths are finite; the calls cost more than scalar instructions. Other application-wide math calls remain. |
| History tail | Replace `memmove` with a backwards pointer loop | At most nine pointers move, and backwards order preserves the overlap semantics. |
| Four-script form selection | Use `and 3` for history selection and changed semantic slots | Offsets are nonnegative; other script counts still use division. |
| Tick level | Use the exact reciprocal multiply for a tick step of ten | All other tick steps still use `divq`. The `lround` that computes the step has already moved outside the process loop in C. |

The C zero-I/O branch and one-cadence heartbeat branch appeared in GCC's
listing, so no extra assembly edit was needed for those. The attempted
replacement of `round(3 * sustained)` remains rejected: the earlier exact
versions passed tests but failed to improve paired timings. The generated
listing also contains the C bit-scan length logic, so the earlier hand
`bsrq` patch was not applied again.

`adjust_length` initially became a separate function after the C refactor;
the sync benchmark regressed. Marking that small hot helper `always_inline`
restored an in-loop implementation. This is a useful reminder to inspect the
generated listing after a source change, even when the C code looks cheaper.

Twelve alternating headless sync runs per pair on this machine gave medians
of **0.0051285 s** for the new GCC assembly and **0.004570 s** for the new
hand assembly, about **10.9% less time**. A separate twelve-pair run gave
**0.004896 s** for the saved previous hand version and **0.004611 s** for
the new hand version, about **5.8% less time**. Every run returned 4,096
drops. The runs are short and the two comparisons occurred at different
times, so treat the percentages as workload-specific observations, not
independent per-edit gains or whole-program frame-rate gains.

The C source passed the warning-enabled syntax check and ASan/UBSan
`--self-test` and `--benchmark-sync` runs. Both new executables passed
`--self-test`; the hand executable passed both headless benchmarks.
Short pseudo-terminal runs with four and three enabled scripts exited
cleanly. Only `as` and `ld` built the final hand executable after the new
GCC listing was generated.
