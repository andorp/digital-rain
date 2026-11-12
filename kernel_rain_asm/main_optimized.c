/*
 * KERNEL RAIN IN C -- a Linux /proc and ncursesw tutorial.
 *
 * Read the numbered sections from top to bottom. The program has three
 * clocks: kernel counters and process tables are sampled at --poll, drops
 * move at --fps, and process identities survive PID reuse via start_time.
 * All procfs and sysfs accesses are reads. No root privileges are needed.
 */

/* STEP 1: Headers, limits, and the small records passed between stages. */
#include <ctype.h>
#include <dirent.h>
#include <errno.h>
#include <getopt.h>
#include <limits.h>
#include <locale.h>
#include <math.h>
#include <ncursesw/curses.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <time.h>
#include <unistd.h>

#define SEMANTIC 6
#define MAX_TRAIL 16
#define CHANNELS 5

typedef struct {
    uint64_t cpu_total, cpu_idle, switches, forks, disk, net;
} Counters;

typedef struct {
    double mean, variance;
    int initialized;
} Baseline;

typedef struct {
    Counters previous;
    double previous_time;
    Baseline baseline[4];
    double cpu_fraction, rates[4];
    char temperature[64];
} Telemetry;

typedef struct {
    int pid;
    uint64_t start_time;
    char name[128], state;
    uint64_t cpu_ticks, read_bytes, write_bytes;
    long rss_pages, threads;
    int io_known;
    uint64_t cpu_delta, read_delta, write_delta;
    long memory_delta, thread_delta;
} Process;

typedef struct {
    Process *items;
    size_t count, capacity;
} ProcessTable;

typedef struct {
    ProcessTable previous;
    double previous_time, elapsed;
} ProcessSampler;

typedef struct Drop Drop;
typedef struct { Drop *drop; unsigned char state; } DropSlot;
struct Drop {
    Process process;
    Drop *next, *all_next;
    const char *glyph[MAX_TRAIL];
    int length, entered, active;
    double head, speed, fade, sustained, length_elapsed;
    int keys[SEMANTIC], offsets[SEMANTIC], symbols_ready;
    uint64_t levels[SEMANTIC], heartbeat[SEMANTIC], cadence[SEMANTIC];
    uint64_t state_changes, memory_movement, thread_movement, rng;
};

typedef struct {
    Drop *head, *tail;
    size_t count;
    double wait;
    int started;
} Column;

typedef struct {
    Column *columns;
    Drop *all;
    DropSlot *slots;
    size_t slot_capacity, slot_count, slot_tombstones;
    int width, height;
    long clock_ticks;
    unsigned glyph_mask;
    uint64_t seed, previous_switches;
    int have_switches;
} Rain;

typedef struct {
    int columns, rows, fill, fps, self_test, benchmark, benchmark_sync;
    double poll;
    uint64_t seed;
    unsigned glyph_mask;
} Options;

static void die(const char *message) {
    fprintf(stderr, "kernel_rain: %s\n", message);
    exit(EXIT_FAILURE);
}

static void *checked_realloc(void *old, size_t bytes) {
    void *result = realloc(old, bytes);
    if (!result) die("out of memory");
    return result;
}

static double monotonic_seconds(void) {
    struct timespec ts;
    if (clock_gettime(CLOCK_MONOTONIC, &ts) != 0) die("clock_gettime failed");
    return (double)ts.tv_sec + (double)ts.tv_nsec / 1e9;
}

static double clamp(double x, double low, double high) {
    return fmax(low, fmin(high, x));
}

/* FNV-1a gives stable placement and animation choices for a fixed seed.
 * This is a reproducibility tool, not a cryptographic hash. */
static uint64_t mix(uint64_t value) {
    value ^= value >> 30;
    value *= UINT64_C(0xbf58476d1ce4e5b9);
    value ^= value >> 27;
    value *= UINT64_C(0x94d049bb133111eb);
    return value ^ (value >> 31);
}

static uint64_t identity_hash(int pid, uint64_t start, uint64_t seed) {
    return mix((uint64_t)(unsigned)pid ^ mix(start) ^ mix(seed));
}

static uint64_t next_random(uint64_t *state) {
    *state += UINT64_C(0x9e3779b97f4a7c15);
    return mix(*state);
}

/* STEP 2: Read the cumulative, system-wide Linux counters. The display
 * divides differences by elapsed monotonic time; raw totals are not rates. */
static int read_counters(Counters *out) {
    memset(out, 0, sizeof(*out));
    FILE *file = fopen("/proc/stat", "r");
    if (!file) return 0;
    char line[1024];
    if (!fgets(line, sizeof(line), file)) { fclose(file); return 0; }
    unsigned long long value[10] = {0};
    int n = sscanf(line, "cpu %llu %llu %llu %llu %llu %llu %llu %llu %llu %llu",
                   &value[0], &value[1], &value[2], &value[3], &value[4],
                   &value[5], &value[6], &value[7], &value[8], &value[9]);
    if (n < 4) { fclose(file); return 0; }
    for (int i = 0; i < n; i++) out->cpu_total += value[i];
    out->cpu_idle = value[3] + (n > 4 ? value[4] : 0);
    while (fgets(line, sizeof(line), file)) {
        unsigned long long count;
        if (sscanf(line, "ctxt %llu", &count) == 1) out->switches = count;
        if (sscanf(line, "processes %llu", &count) == 1) out->forks = count;
    }
    fclose(file);

    file = fopen("/proc/diskstats", "r");
    if (file) {
        while (fgets(line, sizeof(line), file)) {
            char name[64];
            unsigned major, minor;
            unsigned long long reads, merged_reads, sectors_read, read_ms;
            unsigned long long writes, merged_writes, sectors_written;
            /* Fields 6 and 10 are sectors read and written. Parse the
             * preceding fields explicitly so their positions stay clear. */
            int fields = sscanf(line,
                "%u %u %63s %llu %llu %llu %llu %llu %llu %llu",
                &major, &minor, name, &reads, &merged_reads, &sectors_read,
                &read_ms, &writes, &merged_writes, &sectors_written);
            if (fields != 10) continue;
            int nvme = strncmp(name, "nvme", 4) == 0 && !strchr(name, 'p');
            size_t len = strlen(name);
            int sd = len > 0 && (strncmp(name, "sd", 2) == 0 ||
                                  strncmp(name, "vd", 2) == 0 ||
                                  strncmp(name, "xvd", 3) == 0) &&
                     isalpha((unsigned char)name[len - 1]);
            if (nvme || sd) out->disk += (sectors_read + sectors_written) * 512;
        }
        fclose(file);
    }
    file = fopen("/proc/net/dev", "r");
    if (file) {
        while (fgets(line, sizeof(line), file)) {
            char *colon = strchr(line, ':');
            if (!colon) continue;
            *colon = '\0';
            char *iface = line;
            while (isspace((unsigned char)*iface)) iface++;
            if (strcmp(iface, "lo") == 0) continue;
            unsigned long long values[9];
            if (sscanf(colon + 1,
                " %llu %llu %llu %llu %llu %llu %llu %llu %llu",
                &values[0], &values[1], &values[2], &values[3],
                &values[4], &values[5], &values[6], &values[7],
                &values[8]) == 9) out->net += values[0] + values[8];
        }
        fclose(file);
    }
    return 1;
}

/* CPU temperature is optional. Choose known CPU drivers, preferring a die
 * sensor over a control or package reading. Unknown sensors are left alone. */
static void read_temperature(char *out, size_t size) {
    snprintf(out, size, "temp n/a");
    DIR *dir = opendir("/sys/class/hwmon");
    if (!dir) return;
    int best = INT_MAX;
    struct dirent *entry;
    while ((entry = readdir(dir))) {
        if (strncmp(entry->d_name, "hwmon", 5) != 0) continue;
        char path[PATH_MAX], driver[64] = {0};
        snprintf(path, sizeof(path), "/sys/class/hwmon/%s/name", entry->d_name);
        FILE *file = fopen(path, "r");
        if (!file) continue;
        int named = fscanf(file, "%63s", driver) == 1;
        fclose(file);
        if (!named) continue;
        if (strcmp(driver, "k10temp") && strcmp(driver, "coretemp") &&
            strcmp(driver, "zenpower")) continue;
        char directory[PATH_MAX];
        snprintf(directory, sizeof(directory), "/sys/class/hwmon/%s", entry->d_name);
        DIR *sensors = opendir(directory);
        if (!sensors) continue;
        struct dirent *sensor;
        while ((sensor = readdir(sensors))) {
            if (strncmp(sensor->d_name, "temp", 4) != 0 ||
                !strstr(sensor->d_name, "_input")) continue;
            if (snprintf(path, sizeof(path), "%s/%s", directory,
                         sensor->d_name) >= (int)sizeof(path)) continue;
            file = fopen(path, "r");
            if (!file) continue;
            long milli;
            int valid = fscanf(file, "%ld", &milli) == 1;
            fclose(file);
            if (!valid || milli < -20000 || milli > 150000) continue;
            char label[64] = {0};
            char label_path[PATH_MAX];
            snprintf(label_path, sizeof(label_path), "%s", path);
            char *suffix = strstr(label_path, "_input");
            if (suffix) strcpy(suffix, "_label");
            file = fopen(label_path, "r");
            if (file) {
                if (fgets(label, sizeof(label), file))
                    label[strcspn(label, "\n")] = '\0';
                fclose(file);
            }
            int priority = strcmp(label, "Tdie") == 0 ? 0 :
                           strcmp(label, "Tctl") == 0 ? 1 :
                           strncmp(label, "Package id", 10) == 0 ? 2 : 3;
            if (priority < best) {
                best = priority;
                snprintf(out, size, "%s %.0f°C", *label ? label : driver,
                         (double)milli / 1000.0);
            }
        }
        closedir(sensors);
    }
    closedir(dir);
}

/* An exponentially weighted mean and variance learn normal activity over
 * roughly 45 seconds. log1p compresses huge byte-rate spikes. */
static double baseline_observe(Baseline *b, double value, double elapsed) {
    if (!b->initialized) {
        b->initialized = 1;
        b->mean = value;
        return 0.25;
    }
    double alpha = 1.0 - exp(-elapsed / 45.0);
    double difference = value - b->mean;
    b->mean += alpha * difference;
    b->variance = (1.0 - alpha) * (b->variance + alpha * difference * difference);
    return clamp(0.25 + (value - b->mean) / sqrt(b->variance + 0.01) / 5.0, 0, 1);
}

static int telemetry_init(Telemetry *t) {
    memset(t, 0, sizeof(*t));
    if (!read_counters(&t->previous)) return 0;
    t->previous_time = monotonic_seconds();
    read_temperature(t->temperature, sizeof(t->temperature));
    return 1;
}

static int telemetry_sample(Telemetry *t) {
    Counters now;
    if (!read_counters(&now)) return 0;
    double time = monotonic_seconds();
    double dt = fmax(time - t->previous_time, 0.001);
    uint64_t total = now.cpu_total >= t->previous.cpu_total ?
                     now.cpu_total - t->previous.cpu_total : 0;
    uint64_t idle = now.cpu_idle >= t->previous.cpu_idle ?
                    now.cpu_idle - t->previous.cpu_idle : 0;
    if (total) t->cpu_fraction = clamp(1.0 - (double)idle / (double)total, 0, 1);
    uint64_t current[4] = {now.switches, now.forks, now.disk, now.net};
    uint64_t previous[4] = {t->previous.switches, t->previous.forks,
                            t->previous.disk, t->previous.net};
    for (int i = 0; i < 4; i++) {
        t->rates[i] = (double)(current[i] >= previous[i] ?
                                current[i] - previous[i] : 0) / dt;
        (void)baseline_observe(&t->baseline[i], log1p(t->rates[i]), dt);
    }
    t->previous = now;
    t->previous_time = time;
    read_temperature(t->temperature, sizeof(t->temperature));
    return 1;
}

/* STEP 3: Parse one /proc/<pid>/stat record. comm is enclosed in parentheses
 * and may itself contain spaces or ')', so split only after the LAST ')'.
 * The remaining token indices are Linux stat fields 3 onward. */
static int read_process(int pid, Process *out) {
    char path[64], line[4096];
    snprintf(path, sizeof(path), "/proc/%d/stat", pid);
    FILE *file = fopen(path, "r");
    if (!file) return 0;  /* Exits can race every read in this function. */
    int ok = fgets(line, sizeof(line), file) != NULL;
    fclose(file);
    if (!ok) return 0;
    char *open = strchr(line, '('), *close = strrchr(line, ')');
    if (!open || !close || close <= open || close[1] != ' ') return 0;
    memset(out, 0, sizeof(*out));
    out->pid = pid;
    size_t name_len = (size_t)(close - open - 1);
    if (name_len >= sizeof(out->name)) name_len = sizeof(out->name) - 1;
    memcpy(out->name, open + 1, name_len);
    out->name[name_len] = '\0';
    char *fields[22] = {0}, *save = NULL;
    int count = 0;
    for (char *token = strtok_r(close + 2, " \n", &save);
         token && count < 22; token = strtok_r(NULL, " \n", &save))
        fields[count++] = token;
    if (count < 22) return 0;
    out->state = fields[0][0];
    out->cpu_ticks = strtoull(fields[11], NULL, 10) +
                     strtoull(fields[12], NULL, 10);
    out->threads = strtol(fields[17], NULL, 10);
    out->start_time = strtoull(fields[19], NULL, 10);
    out->rss_pages = strtol(fields[21], NULL, 10);
    if (out->rss_pages < 0) out->rss_pages = 0;

    /* /proc/<pid>/io is often protected. Keep an explicit unknown state so
     * zero observed I/O is not confused with inaccessible counters. */
    snprintf(path, sizeof(path), "/proc/%d/io", pid);
    file = fopen(path, "r");
    if (file) {
        int have_read = 0, have_write = 0;
        while (fgets(line, sizeof(line), file)) {
            unsigned long long value;
            if (sscanf(line, "read_bytes: %llu", &value) == 1) {
                out->read_bytes = value;
                have_read = 1;
            }
            if (sscanf(line, "write_bytes: %llu", &value) == 1) {
                out->write_bytes = value;
                have_write = 1;
            }
        }
        fclose(file);
        out->io_known = have_read && have_write;
    }
    return 1;
}

static int identity_compare(const void *a, const void *b) {
    const Process *left = a, *right = b;
    if (left->pid != right->pid) return left->pid < right->pid ? -1 : 1;
    if (left->start_time != right->start_time)
        return left->start_time < right->start_time ? -1 : 1;
    return 0;
}

static void table_add(ProcessTable *table, const Process *process) {
    if (table->count == table->capacity) {
        size_t next = table->capacity ? table->capacity * 2 : 128;
        table->items = checked_realloc(table->items, next * sizeof(*table->items));
        table->capacity = next;
    }
    table->items[table->count++] = *process;
}

static ProcessTable read_process_table(void) {
    ProcessTable table = {0};
    DIR *dir = opendir("/proc");
    if (!dir) return table;
    struct dirent *entry;
    while ((entry = readdir(dir))) {
        char *end;
        errno = 0;
        long pid = strtol(entry->d_name, &end, 10);
        if (errno || *end || pid <= 0 || pid > INT_MAX) continue;
        Process process;
        if (read_process((int)pid, &process)) table_add(&table, &process);
    }
    closedir(dir);
    qsort(table.items, table.count, sizeof(*table.items), identity_compare);
    return table;
}

static void sampler_init(ProcessSampler *sampler) {
    memset(sampler, 0, sizeof(*sampler));
    sampler->previous = read_process_table();
    sampler->previous_time = monotonic_seconds();
    sampler->elapsed = 0.2;
}

static ProcessTable sampler_sample(ProcessSampler *sampler) {
    /* Snapshot acquisition takes time. Use the same point in the cycle for
     * successive elapsed-time measurements, rather than assuming --poll. */
    double now = monotonic_seconds();
    ProcessTable table = read_process_table();
    sampler->elapsed = fmax(now - sampler->previous_time, 0.001);
    for (size_t i = 0; i < table.count; i++) {
        Process *p = &table.items[i];
        const Process *old = bsearch(p, sampler->previous.items,
            sampler->previous.count, sizeof(*p), identity_compare);
        if (!old) continue;
        if (p->cpu_ticks >= old->cpu_ticks)
            p->cpu_delta = p->cpu_ticks - old->cpu_ticks;
        p->memory_delta = p->rss_pages - old->rss_pages;
        p->thread_delta = p->threads - old->threads;
        if (p->io_known && old->io_known) {
            if (p->read_bytes >= old->read_bytes)
                p->read_delta = p->read_bytes - old->read_bytes;
            if (p->write_bytes >= old->write_bytes)
                p->write_delta = p->write_bytes - old->write_bytes;
        }
    }
    free(sampler->previous.items);
    /* Keep raw counters as the next baseline. Deltas occupy separate fields
     * and do not affect the next subtraction. */
    sampler->previous = table;
    sampler->previous_time = now;
    return table;
}

static void sampler_destroy(ProcessSampler *sampler) {
    free(sampler->previous.items);
    memset(sampler, 0, sizeof(*sampler));
}

/* STEP 4: Pressure Stall Information (PSI) is a system-wide signal. avg10
 * selects the strongest resource; cumulative microseconds drive the slow
 * rotation of that position's glyph. Missing PSI is shown as unknown. */
typedef enum { PRESS_UNKNOWN, PRESS_QUIET, PRESS_CPU, PRESS_MEMORY, PRESS_IO } Pressure;
typedef struct { Pressure kind; uint64_t total; } PressureSample;

static PressureSample read_pressure(void) {
    const char *names[3] = {"cpu", "memory", "io"};
    PressureSample result = {PRESS_UNKNOWN, 0};
    double largest = -1.0;
    for (int i = 0; i < 3; i++) {
        char path[64], line[512];
        snprintf(path, sizeof(path), "/proc/pressure/%s", names[i]);
        FILE *file = fopen(path, "r");
        if (!file) continue;
        int ok = fgets(line, sizeof(line), file) != NULL;
        fclose(file);
        if (!ok) continue;
        double avg10;
        unsigned long long total;
        if (sscanf(line, "some avg10=%lf %*s %*s total=%llu", &avg10, &total) != 2)
            continue;
        result.total += total;
        if (avg10 > largest) {
            largest = avg10;
            result.kind = (Pressure)(PRESS_CPU + i);
        }
    }
    if (largest >= 0 && largest < 5.0) result.kind = PRESS_QUIET;
    return result;
}

/* STEP 5: One meaning, four scripts. Arrays are ordered kanji, hiragana,
 * katakana, ASCII. A semantic slot may change form without changing meaning.
 * Tail samples choose a form once and retain it as they move away. */
enum {
    RUN, SLEEP, WAIT, STOP, ZOMBIE, UNKNOWN, QUIET, LOW, MEDIUM, HIGH,
    GROW, SHRINK, STEADY, NONE, READ, WRITE, BOTH, COMPUTE, MEMORY,
    IO_PRESSURE, BIRTH, EXIT_THREAD, SWITCH, SYMBOL_COUNT
};

static const char *const symbols[SYMBOL_COUNT][4] = {
    {"走", "そ", "ソ", "R"}, {"眠", "み", "ミ", "S"},
    {"待", "ま", "マ", "D"}, {"止", "と", "ト", "T"},
    {"終", "し", "シ", "Z"}, {"不", "ふ", "フ", "?"},
    {"静", "せ", "セ", "0"}, {"低", "て", "テ", "L"},
    {"中", "ち", "チ", "M"}, {"高", "こ", "コ", "H"},
    {"増", "ぞ", "ゾ", "+"}, {"減", "げ", "ゲ", "-"},
    {"定", "じ", "ジ", "="}, {"無", "む", "ム", "0"},
    {"読", "よ", "ヨ", "R"}, {"書", "か", "カ", "W"},
    {"双", "そ", "ソ", "B"}, {"算", "さ", "サ", "C"},
    {"憶", "お", "オ", "M"}, {"入", "に", "ニ", "I"},
    {"生", "せ", "セ", "N"}, {"散", "さ", "サ", "X"},
    {"切", "き", "キ", "S"}
};

static int variants(unsigned mask) {
    int count = 0;
    for (int i = 0; i < 4; i++) if (mask & (1u << i)) count++;
    return count;
}

static const char *symbol_form(int key, unsigned mask, int offset) {
    for (int i = 0; i < 4; i++) {
        if (!(mask & (1u << i))) continue;
        if (offset-- == 0) return symbols[key][i];
    }
    return symbols[key][3];
}

/* Optimization: sampling used to scan every existing Drop for each Process.
 * That made a poll quadratic in the process count. Open addressing makes
 * identity lookup constant time on average; a tombstone keeps probe chains
 * intact when a faded drop is removed. Rehash before the table gets crowded. */
static void index_rebuild(Rain *rain, size_t capacity) {
    DropSlot *fresh = calloc(capacity, sizeof(*fresh));
    if (!fresh) die("out of memory");
    size_t count = 0;
    for (Drop *drop = rain->all; drop; drop = drop->all_next) {
        size_t slot = (size_t)identity_hash(drop->process.pid,
            drop->process.start_time, rain->seed) & (capacity - 1);
        while (fresh[slot].state) slot = (slot + 1) & (capacity - 1);
        fresh[slot] = (DropSlot){drop, 1};
        count++;
    }
    free(rain->slots);
    rain->slots = fresh;
    rain->slot_capacity = capacity;
    rain->slot_count = count;
    rain->slot_tombstones = 0;
}

static Drop *find_drop(Rain *rain, int pid, uint64_t start) {
    size_t slot = (size_t)identity_hash(pid, start, rain->seed) &
                  (rain->slot_capacity - 1);
    for (size_t probes = 0; probes < rain->slot_capacity; probes++) {
        DropSlot *entry = &rain->slots[slot];
        if (!entry->state) return NULL;
        if (entry->state == 1 && entry->drop->process.pid == pid &&
            entry->drop->process.start_time == start) return entry->drop;
        slot = (slot + 1) & (rain->slot_capacity - 1);
    }
    return NULL;
}

static void index_insert(Rain *rain, Drop *drop) {
    if ((rain->slot_count + rain->slot_tombstones + 1) * 10 >=
        rain->slot_capacity * 7)
        index_rebuild(rain, rain->slot_capacity * 2);
    size_t slot = (size_t)identity_hash(drop->process.pid,
        drop->process.start_time, rain->seed) & (rain->slot_capacity - 1);
    size_t tombstone = rain->slot_capacity;
    while (rain->slots[slot].state) {
        if (rain->slots[slot].state == 2 && tombstone == rain->slot_capacity)
            tombstone = slot;
        slot = (slot + 1) & (rain->slot_capacity - 1);
    }
    if (tombstone != rain->slot_capacity) {
        slot = tombstone;
        rain->slot_tombstones--;
    }
    rain->slots[slot] = (DropSlot){drop, 1};
    rain->slot_count++;
}

static void index_remove(Rain *rain, const Drop *drop) {
    size_t slot = (size_t)identity_hash(drop->process.pid,
        drop->process.start_time, rain->seed) & (rain->slot_capacity - 1);
    while (rain->slots[slot].state) {
        if (rain->slots[slot].state == 1 && rain->slots[slot].drop == drop) {
            rain->slots[slot].drop = NULL;
            rain->slots[slot].state = 2;
            rain->slot_count--;
            rain->slot_tombstones++;
            if (rain->slot_tombstones * 4 > rain->slot_capacity)
                index_rebuild(rain, rain->slot_capacity);
            return;
        }
        slot = (slot + 1) & (rain->slot_capacity - 1);
    }
    die("drop missing from identity index");
}

static void queue_push(Column *column, Drop *drop) {
    drop->next = NULL;
    if (column->tail) column->tail->next = drop;
    else column->head = drop;
    column->tail = drop;
    column->count++;
}

static Drop *queue_pop(Column *column) {
    Drop *drop = column->head;
    if (!drop) return NULL;
    column->head = drop->next;
    if (!column->head) column->tail = NULL;
    column->count--;
    drop->next = NULL;
    return drop;
}

static void forget_drop(Rain *rain, Drop *target) {
    Drop **link = &rain->all;
    while (*link && *link != target) link = &(*link)->all_next;
    if (*link) *link = target->all_next;
    index_remove(rain, target);
    free(target);
}

static void rain_init(Rain *rain, int columns, int rows, unsigned mask, uint64_t seed) {
    memset(rain, 0, sizeof(*rain));
    rain->width = columns;
    rain->height = rows;
    rain->glyph_mask = mask;
    rain->seed = seed;
    rain->clock_ticks = sysconf(_SC_CLK_TCK);
    if (rain->clock_ticks <= 0) rain->clock_ticks = 100;
    rain->columns = calloc((size_t)columns, sizeof(*rain->columns));
    if (!rain->columns) die("out of memory");
    index_rebuild(rain, 256);
}

static void rain_destroy(Rain *rain) {
    Drop *drop = rain->all;
    while (drop) {
        Drop *next = drop->all_next;
        free(drop);
        drop = next;
    }
    free(rain->columns);
    free(rain->slots);
    memset(rain, 0, sizeof(*rain));
}

static int trail_length(const Process *p) {
    /* The result only needs the integer part of two binary logarithms.
     * Keep libm for enormous counters, where double rounding near a power
     * of two can differ from an integer bit scan. */
    int memory, threads;
    if (p->rss_pages >= 0 && (uint64_t)p->rss_pages < (UINT64_C(1) << 40)) {
        uint64_t pages = (uint64_t)p->rss_pages + 1;
        memory = (63 - __builtin_clzll(pages)) / 2;
    } else {
        memory = (int)(log2((double)p->rss_pages + 1.0) / 2.0);
    }
    long count = p->threads > 0 ? p->threads : 1;
    if ((uint64_t)count < (UINT64_C(1) << 40))
        threads = 63 - __builtin_clzll((uint64_t)count);
    else
        threads = (int)log2((double)count);
    if (memory > 6) memory = 6;
    if (threads > 3) threads = 3;
    int length = SEMANTIC + memory + threads;
    return length > MAX_TRAIL ? MAX_TRAIL : length;
}

static int choose_column(const Rain *rain, const Process *p) {
    int first = (int)(identity_hash(p->pid, p->start_time, rain->seed) %
                      (uint64_t)rain->width);
    size_t minimum = SIZE_MAX;
    int selected = first;
    for (int n = 0; n < rain->width; n++) {
        int x = (first + n) % rain->width;
        if (rain->columns[x].count < minimum) {
            minimum = rain->columns[x].count;
            selected = x;
        }
    }
    return selected;
}

/* On expansion, keep each visible front stream in its original column and
 * move waiting streams into the least occupied columns. The queue links are
 * relinked, not copied, so process identity and history survive resizing. */
static void rain_resize(Rain *rain, int width, int height) {
    int old_width = rain->width;
    Column *old = rain->columns;
    Column *fresh = calloc((size_t)width, sizeof(*fresh));
    if (!fresh) die("out of memory");
    for (int x = 0; x < old_width; x++) {
        int target = x % width;
        for (Drop *drop = queue_pop(&old[x]); drop; drop = queue_pop(&old[x])) {
            if (fresh[target].count && drop->entered) {
                drop->entered = 0;
                drop->head = -1;
            }
            queue_push(&fresh[target], drop);
        }
        if (x < width) {
            fresh[x].wait = old[x].wait;
            fresh[x].started = old[x].started;
        }
    }
    if (width > old_width) {
        for (;;) {
            int source = 0, target = 0;
            for (int x = 1; x < width; x++) {
                if (fresh[x].count > fresh[source].count) source = x;
                if (fresh[x].count < fresh[target].count) target = x;
            }
            if (fresh[source].count - fresh[target].count <= 1) break;
            /* Prefer moving an active waiting stream; an exited one can
             * still move if the source has no active stream behind its head. */
            Drop *prior = fresh[source].head, *chosen_prior = NULL;
            for (Drop *at = prior ? prior->next : NULL; at; at = at->next) {
                if (at->active) chosen_prior = prior;
                prior = at;
            }
            if (!chosen_prior) {
                chosen_prior = fresh[source].head;
                while (chosen_prior->next != fresh[source].tail)
                    chosen_prior = chosen_prior->next;
            }
            Drop *drop = chosen_prior->next;
            chosen_prior->next = drop->next;
            if (fresh[source].tail == drop) fresh[source].tail = chosen_prior;
            fresh[source].count--;
            drop->entered = 0;
            drop->head = -1;
            int empty = fresh[target].count == 0;
            queue_push(&fresh[target], drop);
            if (empty) { fresh[target].wait = 0; fresh[target].started = 1; }
        }
    }
    free(old);
    rain->columns = fresh;
    rain->width = width;
    rain->height = height;
}

/* STEP 6: Project process measurements into six current-state meanings and
 * a history symbol. CPU fraction is relative to ONE core, as in the Python
 * tutorial. A multithreaded process may use more than one core. */
static void semantic_keys(const Process *p, double cpu,
                          Pressure pressure, int keys[SEMANTIC]) {
    switch (p->state) {
        case 'R': keys[0] = RUN; break;
        case 'S': case 'I': keys[0] = SLEEP; break;
        case 'D': keys[0] = WAIT; break;
        case 'T': case 't': keys[0] = STOP; break;
        case 'Z': case 'X': keys[0] = ZOMBIE; break;
        default: keys[0] = UNKNOWN;
    }
    keys[1] = cpu < 0.01 ? QUIET : cpu < 0.1 ? LOW : cpu < 0.5 ? MEDIUM : HIGH;
    keys[2] = p->memory_delta > 16 ? GROW :
              p->memory_delta < -16 ? SHRINK : STEADY;
    keys[3] = !p->io_known ? UNKNOWN :
              p->read_delta && p->write_delta ? BOTH :
              p->read_delta ? READ : p->write_delta ? WRITE : NONE;
    keys[4] = p->thread_delta > 0 ? GROW :
              p->thread_delta < 0 ? SHRINK : STEADY;
    keys[5] = pressure == PRESS_QUIET ? QUIET :
              pressure == PRESS_CPU ? COMPUTE :
              pressure == PRESS_MEMORY ? MEMORY :
              pressure == PRESS_IO ? IO_PRESSURE : UNKNOWN;
}

static void update_semantics(Drop *drop, const Rain *rain, const int keys[SEMANTIC],
                             const uint64_t levels[SEMANTIC], uint64_t switches,
                             int forms) {
    if (!drop->symbols_ready) {
        drop->symbols_ready = 1;
        for (int i = 0; i < SEMANTIC; i++) {
            drop->keys[i] = keys[i];
            drop->levels[i] = levels[i];
            drop->offsets[i] = (int)(next_random(&drop->rng) % (uint64_t)forms);
            drop->cadence[i] = 8000 +
                identity_hash(drop->process.pid, drop->process.start_time,
                              rain->seed ^ (uint64_t)(unsigned)i) % 24000;
        }
    }
    for (int i = 0; i < SEMANTIC; i++) {
        if (drop->keys[i] != keys[i] || drop->levels[i] != levels[i]) {
            drop->offsets[i] = (drop->offsets[i] + 1) % forms;
            drop->heartbeat[i] = 0;
        } else if (switches) {
            drop->heartbeat[i] += switches;
            if (drop->heartbeat[i] >= drop->cadence[i]) {
                drop->offsets[i] = (drop->offsets[i] + 1) % forms;
                /* A usual sample crosses at most one cadence. Preserve the
                 * modulo path for unusually large switch bursts. */
                if (drop->heartbeat[i] < 2 * drop->cadence[i])
                    drop->heartbeat[i] -= drop->cadence[i];
                else
                    drop->heartbeat[i] %= drop->cadence[i];
            }
        }
        drop->keys[i] = keys[i];
        drop->levels[i] = levels[i];
        drop->glyph[i] = symbol_form(keys[i], rain->glyph_mask, drop->offsets[i]);
    }
}

/* This helper is used once per process per sample. Inlining lets the caller
 * retain the sample-wide constants and avoids a call in the hot loop. */
static inline __attribute__((always_inline)) void
adjust_length(Drop *drop, double elapsed, double cpu,
              double io_elapsed, double alpha) {
    const Process *p = &drop->process;
    uint64_t io_delta = p->read_delta + p->write_delta;
    double io = io_delta ? clamp(log1p((double)io_delta / io_elapsed) /
                                 log1p(1000000.0), 0, 1) : 0;
    cpu = clamp(cpu, 0, 1);
    drop->sustained += alpha * (fmax(cpu, io) - drop->sustained);
    int target = trail_length(p) + (int)round(3.0 * drop->sustained);
    if (target > MAX_TRAIL) target = MAX_TRAIL;
    drop->length_elapsed = fmin(0.4, drop->length_elapsed + elapsed);
    if (drop->length_elapsed < 0.4 || target == drop->length) return;
    drop->length_elapsed = 0;
    if (target > drop->length) drop->glyph[drop->length++] = " ";
    else drop->glyph[--drop->length] = " ";
}

static void record_history(Drop *drop, const Rain *rain, double elapsed,
                           double cpu, int forms) {
    if (drop->length <= SEMANTIC) return;
    const Process *p = &drop->process;
    double score = 0, candidate;
    int key = QUIET;
#define CONSIDER(value, meaning) do { \
    candidate = (value); \
    if (candidate > score) { score = candidate; key = (meaning); } \
} while (0)
    CONSIDER(cpu >= 0.01 ? cpu : 0, COMPUTE);
    CONSIDER(clamp((double)p->read_delta / elapsed / 1000000.0, 0, 1), READ);
    CONSIDER(clamp((double)p->write_delta / elapsed / 1000000.0, 0, 1), WRITE);
    CONSIDER(clamp((double)p->memory_delta / 256.0, 0, 1), GROW);
    CONSIDER(clamp((double)-p->memory_delta / 256.0, 0, 1), SHRINK);
    CONSIDER(p->thread_delta > 0 ? 1.0 : 0.0, BIRTH);
    CONSIDER(p->thread_delta < 0 ? 1.0 : 0.0, EXIT_THREAD);
#undef CONSIDER
    for (int i = drop->length - 1; i > SEMANTIC; i--)
        drop->glyph[i] = drop->glyph[i - 1];
    drop->glyph[SEMANTIC] = symbol_form(key, rain->glyph_mask,
        (int)(next_random(&drop->rng) % (uint64_t)forms));
}

static void rain_sync(Rain *rain, const ProcessTable *table, double elapsed,
                      PressureSample pressure, uint64_t switches) {
    uint64_t switch_delta = rain->have_switches && switches >= rain->previous_switches ?
                            switches - rain->previous_switches : 0;
    rain->previous_switches = switches;
    rain->have_switches = 1;
    /* These values are fixed for the whole sample, independent of how many
     * processes it contains. The CPU ratio itself is reused four times for
     * each process below. */
    uint64_t cpu_step = (uint64_t)lround((double)rain->clock_ticks / 10.0);
    if (!cpu_step) cpu_step = 1;
    double cpu_denominator = fmax(elapsed * (double)rain->clock_ticks, 0.001);
    double io_elapsed = fmax(elapsed, 0.001);
    double alpha = 1.0 - exp(-elapsed / 4.0);
    int forms = variants(rain->glyph_mask);
    uint64_t pressure_level = pressure.total / 1000000;
    for (Drop *drop = rain->all; drop; drop = drop->all_next) drop->active = 0;
    for (size_t i = 0; i < table->count; i++) {
        const Process *p = &table->items[i];
        Drop *drop = find_drop(rain, p->pid, p->start_time);
        if (!drop) {
            drop = calloc(1, sizeof(*drop));
            if (!drop) die("out of memory");
            drop->process = *p;
            drop->head = -1;
            drop->fade = 1;
            drop->length = trail_length(p);
            drop->rng = identity_hash(p->pid, p->start_time, rain->seed);
            for (int n = 0; n < MAX_TRAIL; n++) drop->glyph[n] = " ";
            index_insert(rain, drop);
            drop->all_next = rain->all;
            rain->all = drop;
            queue_push(&rain->columns[choose_column(rain, p)], drop);
        } else {
            drop->process = *p;
            drop->fade = 1;
        }
        drop->active = 1;
        double cpu = (double)p->cpu_delta / cpu_denominator;
        int keys[SEMANTIC];
        semantic_keys(p, cpu, pressure.kind, keys);
        if (drop->symbols_ready && keys[0] != drop->keys[0]) drop->state_changes++;
        drop->memory_movement += (uint64_t)labs(p->memory_delta);
        drop->thread_movement += (uint64_t)labs(p->thread_delta);
        uint64_t levels[SEMANTIC] = {
            drop->state_changes,
            p->cpu_ticks / cpu_step,
            drop->memory_movement / 16,
            (p->read_bytes + p->write_bytes) / 65536,
            drop->thread_movement,
            pressure_level
        };
        update_semantics(drop, rain, keys, levels, switch_delta, forms);
        adjust_length(drop, elapsed, cpu, io_elapsed, alpha);
        record_history(drop, rain, elapsed, cpu, forms);
        drop->speed = 8.0 + 12.0 * clamp(cpu, 0, 1);
    }
}

/* STEP 7: Move only the front stream of each column. A dead stream is removed
 * when its fade reaches the first invisible tier. Waiting live streams then
 * get their turn instead of sitting behind a blank column for many seconds. */
static double startup_delay(const Rain *rain, const Drop *drop) {
    uint64_t h = identity_hash(drop->process.pid, drop->process.start_time,
                               rain->seed ^ UINT64_C(0x7374617274));
    return (double)h / (double)UINT64_MAX * 5.0;
}

static void rain_step(Rain *rain, double dt) {
    for (int x = 0; x < rain->width; x++) {
        Column *column = &rain->columns[x];
        Drop *drop = column->head;
        if (!drop) continue;
        if (!drop->entered) {
            if (!column->started) {
                column->wait = startup_delay(rain, drop);
                column->started = 1;
            }
            column->wait = fmax(0, column->wait - dt);
            if (column->wait > 0) continue;
            drop->entered = 1;
        }
        drop->head += drop->speed * dt;
        if (!drop->active) drop->fade *= exp(-dt / 0.8);
        if (drop->head - (double)drop->length >= rain->height ||
            (!drop->active && drop->fade < 0.25)) {
            (void)queue_pop(column);
            double delay = 0.4 + startup_delay(rain, drop) / 6.0;
            if (drop->active) {
                drop->head = -1;
                drop->entered = 0;
                queue_push(column, drop);
            } else {
                forget_drop(rain, drop);
            }
            column->wait = delay;
        }
    }
}

/* STEP 8: ncursesw paints a two-cell stride per LED. Japanese glyphs occupy
 * both cells; ASCII occupies one and leaves the second blank. The renderer
 * knows only glyph and brightness, not what a process measurement means. */
static void render(const Rain *rain, const Telemetry *telemetry, int paused) {
    int height, width;
    getmaxyx(stdscr, height, width);
    erase();
    if (width < rain->width * 2 || height < 4) {
        mvprintw(0, 0, "Enlarge terminal: width >= %d, height >= 4",
                 rain->width * 2);
        refresh();
        return;
    }
    int rows = rain->height < height - 2 ? rain->height : height - 2;
    for (int x = 0; x < rain->width; x++) {
        const Drop *drop = rain->columns[x].head;
        if (!drop || !drop->entered) continue;
        for (int distance = drop->length - 1; distance >= 0; distance--) {
            const char *glyph = drop->glyph[distance];
            if (!glyph || strcmp(glyph, " ") == 0) continue;
            int y = (int)drop->head - distance;
            if (y < 0 || y >= rows) continue;
            double fraction = (double)distance / (double)drop->length;
            int tier = distance == 0 ? 3 : fraction < 0.45 ? 2 : 1;
            if (drop->fade < 0.75) tier--;
            if (drop->fade < 0.25) tier = 0;
            if (!tier) continue;
            attr_t attr = has_colors() ? COLOR_PAIR(tier) : 0;
            if (tier == 1) attr |= A_DIM;
            if (tier == 3) attr |= A_BOLD;
            attron(attr);
            (void)mvaddstr(y, x * 2, glyph);
            attroff(attr);
        }
    }
    int active = 0;
    for (const Drop *drop = rain->all; drop; drop = drop->all_next)
        if (drop->active) active++;
    char status[512], footer[256];
    snprintf(status, sizeof(status),
        "CPU %3.0f%% %s | proc %3d | switch %.0f/s | fork %.0f/s | "
        "disk %.1f MB/s | net %.1f MB/s",
        telemetry->cpu_fraction * 100, telemetry->temperature, active,
        telemetry->rates[0], telemetry->rates[1],
        telemetry->rates[2] / 1e6, telemetry->rates[3] / 1e6);
    snprintf(footer, sizeof(footer), "%dx%d LEDs | q quit | space pause | r relearn%s",
             rain->width, rain->height, paused ? " | PAUSED" : "");
    (void)mvaddnstr(height - 2, 0, status, width - 1);
    (void)mvaddnstr(height - 1, 0, footer, width - 1);
    refresh();
}

/* STEP 9: Parse options before curses changes the terminal. A `--source`
 * option makes the procfs scope explicit to people switching from Python. */
static void usage(FILE *stream) {
    fprintf(stream,
        "Usage: kernel_rain [OPTIONS]\n"
        "  --fill                 fit the terminal and respond to resize\n"
        "  --columns N            columns (default 30)\n"
        "  --rows N               rows (default 60)\n"
        "  --fps N                animation frames/s (default 30)\n"
        "  --poll SECONDS         procfs interval (default 0.2)\n"
        "  --glyphs LIST          comma-separated kanji,hiragana,katakana,ascii\n"
        "  --seed N               repeatable placement and glyph selection\n"
        "  --source proc          procfs mode; eBPF is not built here\n"
        "  --self-test            run headless simulation checks\n"
        "  --benchmark            time deterministic process sorting and lookup\n"
        "  --benchmark-sync       time deterministic process-to-drop updates\n"
        "  --help                 show this help\n");
}

static int positive_int(const char *text, const char *name) {
    char *end;
    errno = 0;
    long value = strtol(text, &end, 10);
    if (errno || !*text || *end || value <= 0 || value > INT_MAX) {
        fprintf(stderr, "invalid %s: %s\n", name, text);
        exit(EXIT_FAILURE);
    }
    return (int)value;
}

static double positive_double(const char *text, const char *name) {
    char *end;
    errno = 0;
    double value = strtod(text, &end);
    if (errno || !*text || *end || !isfinite(value) || value <= 0) {
        fprintf(stderr, "invalid %s: %s\n", name, text);
        exit(EXIT_FAILURE);
    }
    return value;
}

static unsigned parse_glyphs(const char *list) {
    char *copy = strdup(list);
    if (!copy) die("out of memory");
    unsigned mask = 0;
    char *save;
    for (char *part = strtok_r(copy, ",", &save); part;
         part = strtok_r(NULL, ",", &save)) {
        if (strcmp(part, "kanji") == 0) mask |= 1u;
        else if (strcmp(part, "hiragana") == 0) mask |= 2u;
        else if (strcmp(part, "katakana") == 0) mask |= 4u;
        else if (strcmp(part, "ascii") == 0) mask |= 8u;
        else { free(copy); die("unknown glyph set"); }
    }
    free(copy);
    if (!mask) die("empty glyph selection");
    return mask;
}

static Options parse_options(int argc, char **argv) {
    Options options = {30, 60, 0, 30, 0, 0, 0, 0.2, 0, 15u};
    static const struct option long_options[] = {
        {"fill", no_argument, NULL, 'F'}, {"columns", required_argument, NULL, 'c'},
        {"rows", required_argument, NULL, 'r'}, {"fps", required_argument, NULL, 'f'},
        {"poll", required_argument, NULL, 'p'}, {"glyphs", required_argument, NULL, 'g'},
        {"seed", required_argument, NULL, 's'}, {"source", required_argument, NULL, 'S'},
        {"self-test", no_argument, NULL, 'T'},
        {"benchmark", no_argument, NULL, 'B'},
        {"benchmark-sync", no_argument, NULL, 'Y'},
        {"help", no_argument, NULL, 'h'},
        {NULL, 0, NULL, 0}
    };
    int option;
    while ((option = getopt_long(argc, argv, "", long_options, NULL)) != -1) {
        switch (option) {
            case 'F': options.fill = 1; break;
            case 'c': options.columns = positive_int(optarg, "columns"); break;
            case 'r': options.rows = positive_int(optarg, "rows"); break;
            case 'f': options.fps = positive_int(optarg, "fps"); break;
            case 'p': options.poll = positive_double(optarg, "poll"); break;
            case 'g': options.glyph_mask = parse_glyphs(optarg); break;
            case 's': {
                char *end;
                errno = 0;
                options.seed = strtoull(optarg, &end, 10);
                if (errno || !*optarg || *end || optarg[0] == '-') die("invalid seed");
                break;
            }
            case 'S': if (strcmp(optarg, "proc")) die("only --source proc is supported");
                      break;
            case 'T': options.self_test = 1; break;
            case 'B': options.benchmark = 1; break;
            case 'Y': options.benchmark_sync = 1; break;
            case 'h': usage(stdout); exit(EXIT_SUCCESS);
            default: usage(stderr); exit(EXIT_FAILURE);
        }
    }
    if (optind != argc) die("unexpected positional argument");
    return options;
}

/* These tests run without curses or access to /proc, making queue behavior
 * reproducible even on a busy machine. `make check` calls this mode. */
static void self_test(void) {
    Rain rain;
    rain_init(&rain, 1, 60, 8u, 1);
    ProcessTable table = {0};
    Process p = {0};
    p.state = 'S'; p.start_time = 1; p.rss_pages = 1; p.threads = 1;
    for (int i = 1; i <= 4; i++) {
        p.pid = i;
        table_add(&table, &p);
    }
    qsort(table.items, table.count, sizeof(*table.items), identity_compare);
    PressureSample pressure = {PRESS_QUIET, 0};
    rain_sync(&rain, &table, 0.2, pressure, 0);
    Drop *front = rain.columns[0].head;
    front->entered = 1; front->head = 12;
    rain_resize(&rain, 3, 60);
    if (rain.columns[0].head != front || !front->entered || front->head != 12 ||
        rain.columns[0].count != 2 || rain.columns[1].count != 1 ||
        rain.columns[2].count != 1) die("resize self-test failed");
    free(table.items);
    rain_destroy(&rain);

    rain_init(&rain, 1, 60, 8u, 1);
    table = (ProcessTable){0};
    p.pid = 1; table_add(&table, &p);
    p.pid = 2; table_add(&table, &p);
    rain_sync(&rain, &table, 0.2, pressure, 0);
    front = rain.columns[0].head;
    front->entered = 1; front->head = 0;
    rain.columns[0].started = 1;
    table.items[0] = table.items[1];
    table.count = 1;
    rain_sync(&rain, &table, 0.2, pressure, 0);
    for (int i = 0; i < 20; i++) rain_step(&rain, 0.1);
    if (rain.columns[0].head == front || find_drop(&rain, 1, 1))
        die("fade self-test failed");
    free(table.items);
    rain_destroy(&rain);
    /* Exercise growth, tombstones, rebuilds, and PID reuse in the optimized
     * identity index without involving the terminal or procfs. */
    rain_init(&rain, 1, 60, 8u, 1);
    for (int i = 1; i <= 1024; i++) {
        Drop *drop = calloc(1, sizeof(*drop));
        if (!drop) die("out of memory");
        drop->process.pid = i;
        drop->process.start_time = 1;
        index_insert(&rain, drop);
        drop->all_next = rain.all;
        rain.all = drop;
    }
    for (int i = 2; i <= 1024; i += 2) {
        Drop *drop = find_drop(&rain, i, 1);
        if (!drop) die("index growth self-test failed");
        forget_drop(&rain, drop);
    }
    for (int i = 1; i <= 1024; i++) {
        if ((find_drop(&rain, i, 1) != NULL) != (i % 2 == 1))
            die("index removal self-test failed");
    }
    for (int i = 2; i <= 1024; i += 2) {
        Drop *drop = calloc(1, sizeof(*drop));
        if (!drop) die("out of memory");
        drop->process.pid = i;
        drop->process.start_time = 2;
        index_insert(&rain, drop);
        drop->all_next = rain.all;
        rain.all = drop;
        if (find_drop(&rain, i, 1) || find_drop(&rain, i, 2) != drop)
            die("PID reuse self-test failed");
    }
    rain_destroy(&rain);
    puts("kernel_rain: self-test passed");
}

/* A deterministic, headless workload for the part of the program that calls
 * identity_compare. The checksum proves both executables found the same
 * process identities. Time includes libc qsort/bsearch and memory traffic;
 * it is NOT a prediction of whole-screen frames per second. */
static void benchmark(void) {
    enum { N = 4096, ROUNDS = 128 };
    Process *items = calloc(N, sizeof(*items));
    if (!items) die("out of memory");
    uint64_t checksum = 0;
    double start = monotonic_seconds();
    for (int round = 0; round < ROUNDS; round++) {
        for (int i = 0; i < N; i++) {
            items[i].pid = ((i * 2053 + round * 137) & (N - 1)) + 1;
            items[i].start_time = (uint64_t)(unsigned)round;
        }
        qsort(items, N, sizeof(*items), identity_compare);
        for (int i = 0; i < N; i++) {
            Process key = {.pid = i + 1, .start_time = (uint64_t)(unsigned)round};
            const Process *found = bsearch(&key, items, N, sizeof(*items),
                                           identity_compare);
            if (!found) die("benchmark lookup failed");
            checksum += (uint64_t)(unsigned)found->pid;
        }
    }
    printf("sort+lookup: %.6f s, checksum=%llu\n",
           monotonic_seconds() - start, (unsigned long long)checksum);
    free(items);
}

/* This synthetic sample isolates process-to-drop lookup from procfs I/O and
 * terminal drawing. Every round contains the same 4096 live identities. */
static void benchmark_sync(void) {
    enum { N = 4096, ROUNDS = 8 };
    Rain rain;
    rain_init(&rain, 30, 60, 8u, 1);
    ProcessTable table = {0};
    Process p = {0};
    p.state = 'S'; p.start_time = 1; p.rss_pages = 16; p.threads = 1;
    for (int i = 1; i <= N; i++) { p.pid = i; table_add(&table, &p); }
    PressureSample pressure = {PRESS_QUIET, 0};
    double start = monotonic_seconds();
    for (int round = 0; round < ROUNDS; round++) {
        for (size_t i = 0; i < table.count; i++) {
            table.items[i].cpu_ticks += 1;
            table.items[i].cpu_delta = 1;
        }
        rain_sync(&rain, &table, 0.2, pressure, (uint64_t)(unsigned)round * 1000);
    }
    size_t count = 0;
    for (const Drop *drop = rain.all; drop; drop = drop->all_next) count++;
    if (count != N) die("sync benchmark produced wrong drop count");
    printf("sync: %.6f s, drops=%zu\n", monotonic_seconds() - start, count);
    free(table.items);
    rain_destroy(&rain);
}

/* STEP 10: The main loop keeps rendering smooth while sampling /proc less
 * often. A pause freezes the rain; samples still advance the baselines. */
int main(int argc, char **argv) {
    setlocale(LC_ALL, "");
    Options options = parse_options(argc, argv);
    if (options.self_test) { self_test(); return EXIT_SUCCESS; }
    if (options.benchmark) { benchmark(); return EXIT_SUCCESS; }
    if (options.benchmark_sync) { benchmark_sync(); return EXIT_SUCCESS; }
    WINDOW *screen = initscr();
    if (!screen) die("cannot initialize terminal");
    cbreak(); noecho(); keypad(stdscr, TRUE); nodelay(stdscr, TRUE);
    (void)curs_set(0);
    if (has_colors()) {
        start_color();
        short background = use_default_colors() == OK ? -1 : COLOR_BLACK;
        init_pair(1, COLOR_GREEN, background);
        init_pair(2, COLOR_GREEN, background);
        init_pair(3, COLOR_WHITE, background);
    }
    int height, width;
    getmaxyx(stdscr, height, width);
    int columns = options.fill ? (width > 1 ? (width - 1) / 2 : 1) : options.columns;
    int rows = options.fill ? (height > 2 ? height - 2 : 1) : options.rows;
    Rain rain;
    rain_init(&rain, columns, rows, options.glyph_mask, options.seed);
    Telemetry telemetry;
    if (!telemetry_init(&telemetry)) {
        endwin();
        die("cannot read /proc/stat");
    }
    ProcessSampler sampler;
    sampler_init(&sampler);
    int paused = 0;
    double last_frame = monotonic_seconds();
    double next_poll = last_frame + options.poll;
    for (;;) {
        double frame_start = monotonic_seconds();
        double dt = clamp(frame_start - last_frame, 0, 0.1);
        last_frame = frame_start;
        if (options.fill) {
            getmaxyx(stdscr, height, width);
            int new_columns = width > 1 ? (width - 1) / 2 : 1;
            int new_rows = height > 2 ? height - 2 : 1;
            if (new_columns != rain.width || new_rows != rain.height)
                rain_resize(&rain, new_columns, new_rows);
        }
        int key = getch();
        if (key == 'q' || key == 'Q' || key == 27) break;
        if (key == ' ') paused = !paused;
        if (key == 'r') {
            if (!telemetry_init(&telemetry)) break;
            sampler_destroy(&sampler);
            sampler_init(&sampler);
            rain.have_switches = 0;
            next_poll = frame_start + options.poll;
        }
        if (frame_start >= next_poll) {
            if (telemetry_sample(&telemetry)) {
                ProcessTable snapshot = sampler_sample(&sampler);
                if (!paused) rain_sync(&rain, &snapshot, sampler.elapsed,
                                       read_pressure(), telemetry.previous.switches);
            }
            next_poll = frame_start + options.poll;
        }
        if (!paused) rain_step(&rain, dt);
        render(&rain, &telemetry, paused);
        double remaining = 1.0 / (double)options.fps -
                           (monotonic_seconds() - frame_start);
        if (remaining > 0) {
            struct timespec delay = {(time_t)remaining,
                (long)((remaining - floor(remaining)) * 1e9)};
            (void)nanosleep(&delay, NULL);
        }
    }
    endwin();
    sampler_destroy(&sampler);
    rain_destroy(&rain);
    return EXIT_SUCCESS;
}
