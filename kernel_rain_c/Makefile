CC ?= cc
CFLAGS ?= -O2 -g
CPPFLAGS += -D_POSIX_C_SOURCE=200809L -D_XOPEN_SOURCE=700
WARNINGS = -std=c11 -Wall -Wextra -Wpedantic -Wconversion -Wshadow
LDLIBS = -lncursesw -lm

.PHONY: all check clean

all: kernel_rain

kernel_rain: main.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(WARNINGS) -o $@ $< $(LDLIBS)

check: kernel_rain
	./kernel_rain --self-test

clean:
	rm -f kernel_rain
