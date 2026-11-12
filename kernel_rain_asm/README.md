# Kernel Rain: optimized assembly edition

This is a separate x86-64 copy of the [C tutorial](../kernel_rain_c/README.md).
It contains both the C inputs and GCC `-O3` assembly outputs:

| File | Purpose |
|---|---|
| `main.c`, `baseline.s` | Original C algorithm and its optimized GCC assembly |
| `main_optimized.c`, `optimized.s` | Indexed process lookup and its optimized GCC assembly |
| `OPTIMIZATION_LOG.md` | Reproducible experiment and explanation |

Build and verify from this directory:

```sh
make
make check
make benchmark
./kernel_rain_optimized --fill
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
