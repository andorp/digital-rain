"""Optional BCC/eBPF scheduler event collector for kernel_rain.py.

Requires python3-bpfcc (Ubuntu/Debian) and privileges to attach tracepoints.
No process names, arguments or other sensitive payloads are collected.
"""
from collections import deque
from dataclasses import dataclass
from threading import Thread, Lock
import time

BPF_PROGRAM = r'''
#include <uapi/linux/ptrace.h>
struct event_t { u64 timestamp_ns; u32 cpu; u32 prev_pid; u32 next_pid; };
BPF_PERF_OUTPUT(events);
TRACEPOINT_PROBE(sched, sched_switch) {
    struct event_t e = {};
    e.timestamp_ns = bpf_ktime_get_ns();
    e.cpu = bpf_get_smp_processor_id();
    e.prev_pid = args->prev_pid;
    e.next_pid = args->next_pid;
    events.perf_submit(args, &e, sizeof(e));
    return 0;
}
'''

@dataclass(frozen=True)
class ScheduleEvent:
    timestamp_ns: int
    cpu: int
    prev_pid: int
    next_pid: int

class SchedulerCollector:
    """Collect real sched_switch events asynchronously; bounded memory.

    The callback runs in a dedicated thread because BCC perf_buffer_poll blocks.
    A lock protects the small queue while the curses thread drains it.
    High scheduler rates can overflow the queue: drops are counted.
    """
    def __init__(self, max_events=8192):
        try:
            from bcc import BPF
        except ImportError as exc:
            raise RuntimeError('BCC Python bindings missing; install python3-bpfcc') from exc
        self.bpf = BPF(text=BPF_PROGRAM)
        self.queue = deque(maxlen=max_events)
        self.lock = Lock()
        self.lost = 0
        self.error = None
        self.running = True
        def on_event(cpu, data, size):
            e = self.bpf['events'].event(data)
            item = ScheduleEvent(int(e.timestamp_ns), int(e.cpu), int(e.prev_pid), int(e.next_pid))
            with self.lock:
                if len(self.queue) == self.queue.maxlen:
                    self.lost += 1
                self.queue.append(item)
        def on_lost(cpu, count):
            with self.lock:
                self.lost += count
        self.bpf['events'].open_perf_buffer(on_event, page_cnt=64, lost_cb=on_lost)
        self.thread = Thread(target=self._poll, daemon=True)
        self.thread.start()

    def _poll(self):
        while self.running:
            try:
                self.bpf.perf_buffer_poll(timeout=100)
            except Exception as exc:
                self.error = str(exc)
                self.running = False

    def drain(self, max_items=4096):
        with self.lock:
            items = [self.queue.popleft() for _ in range(min(max_items, len(self.queue)))]
            lost = self.lost
            self.lost = 0
        return items, lost

    def close(self):
        self.running = False
        self.thread.join(timeout=1.0)
