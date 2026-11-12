# Kernel Rain: optimized assembly edition

This is a separate x86-64 copy of the [C tutorial](../kernel_rain_c/README.md).
It contains both the C inputs and GCC `-O3` assembly outputs:

| File | Purpose |
|---|---|
| `main.c`, `baseline.s` | Original C algorithm and its optimized GCC assembly |
| `main_optimized.c`, `optimized.s` | Indexed lookup, C-level hot-path changes, and their GCC `-O3` assembly |
| `hand_optimized.s` | Further hand-edited assembly from the current `optimized.s`, assembled with `as` and linked with `ld` |
| `OPTIMIZATION_LOG.md` | Reproducible experiment and explanation |
| `HAND_OPTIMIZATION_LOG.md` | Notes and measurements for the hand edit |

Build and verify from this directory:

```sh
make
make check
make benchmark
make hand check-hand benchmark-hand
./kernel_rain_optimized --fill
./kernel_rain_hand --fill
```

The assembly and executable target **generic x86-64 Linux** and link against
wide-character ncurses and libm. Install `gcc`, `make`, and the ncurses
development package (for example `libncurses-dev` on Debian/Ubuntu). The
program still reads procfs without root privileges. As in the C tutorial,
the optional Python eBPF collector is outside this version.

`make benchmark` times deterministic headless workloads; it does not measure
terminal frame rate or disk activity. `make check` exercises both queue
implementations. Run `make clean` to remove executables while keeping the
assembly artifacts and source files.

The `hand` target uses GNU `as` and `ld` directly. It does not invoke GCC.
It expects the standard Debian/Ubuntu x86-64 startup objects under
`/usr/lib/x86_64-linux-gnu`; adjust those paths on other distributions.
