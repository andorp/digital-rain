# The checked-in .s files are the readable build products. Rebuilding one
# from its C source uses the same GCC options recorded in OPTIMIZATION_LOG.md.
GCC = gcc
ASMFLAGS = -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -std=c11 \
           -O3 -march=x86-64 -mtune=generic -fno-plt -fomit-frame-pointer
LDLIBS = -lncursesw -lm

.PHONY: all check benchmark clean

all: kernel_rain_optimized

baseline.s: main.c
	$(GCC) $(ASMFLAGS) -S -o $@ $<

optimized.s: main_optimized.c
	$(GCC) $(ASMFLAGS) -S -o $@ $<

kernel_rain_baseline: baseline.s
	$(GCC) -o $@ $< $(LDLIBS)

kernel_rain_optimized: optimized.s
	$(GCC) -o $@ $< $(LDLIBS)

check: kernel_rain_baseline kernel_rain_optimized
	./kernel_rain_baseline --self-test
	./kernel_rain_optimized --self-test

benchmark: kernel_rain_baseline kernel_rain_optimized
	./kernel_rain_baseline --benchmark-sync
	./kernel_rain_optimized --benchmark-sync
	./kernel_rain_baseline --benchmark
	./kernel_rain_optimized --benchmark

clean:
	rm -f kernel_rain_baseline kernel_rain_optimized
