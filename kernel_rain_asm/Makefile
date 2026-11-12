# The checked-in .s files are the readable build products. Rebuilding one
# from its C source uses the same GCC options recorded in OPTIMIZATION_LOG.md.
GCC = gcc
ASMFLAGS = -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700 -std=c11 \
           -O3 -march=x86-64 -mtune=generic -fno-plt -fomit-frame-pointer
LDLIBS = -lncursesw -lm

.PHONY: all hand check check-hand benchmark benchmark-hand clean

all: kernel_rain_optimized

baseline.s: main.c
	$(GCC) $(ASMFLAGS) -S -o $@ $<

optimized.s: main_optimized.c
	$(GCC) $(ASMFLAGS) -S -o $@ $<

kernel_rain_baseline: baseline.s
	$(GCC) -o $@ $< $(LDLIBS)

kernel_rain_optimized: optimized.s
	$(GCC) -o $@ $< $(LDLIBS)

# This path deliberately does not run GCC. It assembles the hand-edited
# listing and links against the system C runtime and shared libraries.
hand: kernel_rain_hand

hand_optimized.o: hand_optimized.s
	as --64 -o $@ $<

kernel_rain_hand: hand_optimized.o
	ld -pie --dynamic-linker /lib64/ld-linux-x86-64.so.2 -o $@ \
	  /usr/lib/x86_64-linux-gnu/Scrt1.o \
	  /usr/lib/x86_64-linux-gnu/crti.o $< \
	  -L/usr/lib/x86_64-linux-gnu -lncursesw -lm -lc \
	  /usr/lib/x86_64-linux-gnu/crtn.o

check: kernel_rain_baseline kernel_rain_optimized
	./kernel_rain_baseline --self-test
	./kernel_rain_optimized --self-test

check-hand: kernel_rain_hand
	./kernel_rain_hand --self-test

benchmark: kernel_rain_baseline kernel_rain_optimized
	./kernel_rain_baseline --benchmark-sync
	./kernel_rain_optimized --benchmark-sync
	./kernel_rain_baseline --benchmark
	./kernel_rain_optimized --benchmark

benchmark-hand: kernel_rain_hand
	./kernel_rain_hand --benchmark-sync
	./kernel_rain_hand --benchmark

clean:
	rm -f kernel_rain_baseline kernel_rain_optimized kernel_rain_hand hand_optimized.o
