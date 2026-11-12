# Optimization log: from C to x86-64 assembly

This tutorial records an experiment, including an attempted change that did
not show a reliable gain. The goal is to make the reasoning reproducible;
"optimized" means faster on the measured process-sync workload, not a claim
of a maximum possible speed on every machine.

## 1. Freeze a baseline

`main.c` copies the C tutorial, adding only two headless benchmark options.
GCC 13.3.0 on x86-64 generated `baseline.s` with:

```sh
gcc -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -std=c11 \
  -O3 -march=x86-64 -mtune=generic -fno-plt -fomit-frame-pointer \
  -S -o baseline.s main.c
gcc -o kernel_rain_baseline baseline.s -lncursesw -lm
```

The `-O3` pass already inlines small helpers, removes unused code, and lays
out branches. The target is generic x86-64 rather than this machine's exact
CPU, so the generated executable remains usable on other x86-64 Linux hosts.
The `.s` files are real compiler output and are checked in for inspection.

`--benchmark-sync` updates 4,096 persistent processes eight times without
reading procfs or drawing a terminal. `--benchmark` repeatedly sorts 4,096
identities and looks each one up with libc `qsort`/`bsearch`. Both check their
results. These workloads separate CPU work from the variable cost of procfs
and terminal rendering.

## 2. Try the smallest assembly change first

The `identity_compare` function remained standalone in GCC output because
libc calls it through a function pointer. I tried replacing GCC's mostly
branchless return-value calculation with explicit signed PID branches and an
unsigned 64-bit start-time tie-breaker. The return values and self-tests were
correct. Five alternating sort-and-lookup runs gave medians of about
**0.03927 s** for GCC's assembly and **0.03965 s** for the hand edit.
That difference is within timing noise and does not justify keeping the hand
edit. The final `optimized.s` uses GCC's comparator.

This matters because fewer instructions do not automatically mean faster
code: branch prediction, cache misses, and the caller's own work can dominate
a small function.

## 3. Find the real repeated work

In the baseline, `rain_sync()` calls `find_drop()` for every process. That
helper walks the linked list of all existing drops, comparing `(PID, start
time)` pairs. With *n* persistent processes, a poll can do roughly *n²/2*
identity comparisons. The compiler can make each comparison cheap, but it
cannot remove the list traversal without a change to the data structure.

`main_optimized.c` adds an open-addressed hash index from `(PID, start time)`
to `Drop *`. The original linked list still owns the drops and supplies
iteration. The index grows before reaching 70% occupancy. Removal leaves a
tombstone so lookups can cross a deleted slot; the table rebuilds when
tombstones exceed a quarter of its slots. PID reuse gets a different key
because start time is part of the hash and equality check.

The optimized assembly was then generated with the **same** GCC flags:

```sh
gcc -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -std=c11 \
  -O3 -march=x86-64 -mtune=generic -fno-plt -fomit-frame-pointer \
  -S -o optimized.s main_optimized.c
gcc -o kernel_rain_optimized optimized.s -lncursesw -lm
```

The important assembly change is structural: the linear pointer walk in
`rain_sync` becomes a hash, masked slot index, and short probe loop. In the
source, search for `find_drop`, `index_insert`, and `index_remove`; in the
assembly, search for `index_insert` and `rain_sync` (GCC inlines `find_drop`).
This is an example of improving generated assembly by giving the optimizer a
better algorithm, then checking the actual `.s` output.

## 4. Measure the result and its limits

On this machine, five alternating `--benchmark-sync` runs per version gave:

| Version | Seconds, sorted runs | Median |
|---|---|---:|
| Baseline | 0.135763, 0.147631, 0.148464, 0.154694, 0.156298 | 0.148464 s |
| Indexed | 0.006273, 0.006335, 0.006347, 0.006351, 0.006394 | 0.006347 s |

The measured speedup for that synthetic workload is about **23.4×**. Each
run returned `drops=4096`. The result is most relevant when many processes
persist across polls. Real frame rate may change less because reading procfs
and painting ncurses also take time. For small process tables, the extra hash
memory and hashing work can offset some benefit.

`make check` passed for both assembly executables. The optimized C source
also passed AddressSanitizer and UndefinedBehaviorSanitizer self-tests and
the 4,096-process sync workload. Its extra self-test checks index growth,
removal, tombstone rebuilds, and PID reuse. The optimized executable was
linked from `optimized.s`, not directly from the C source.

## 5. Repeat or inspect

```sh
make check
make benchmark
rg -n 'identity_compare|index_insert|rain_sync' baseline.s optimized.s
objdump -d kernel_rain_optimized | less
```

Timings fluctuate with CPU frequency, temperature, and other work. Repeat
them on your machine and compare medians. To try another idea, edit
`main_optimized.c`, run `make optimized.s kernel_rain_optimized`, and compare
again. If you hand-edit `optimized.s`, save that patch separately: `make` will
regenerate the file whenever its C input is newer.
