import os
c = get_config()
#------------------------------------------------------------------------------
# permission 775 for new dirs (for easy sharing)
os.umask(0o002) 
#------------------------------------------------------------------------------
# memory/cpu limit for display
def get_mem_total() -> int:
    with Path("/proc/meminfo").open("r") as fin:
        for line in fin:
            if line.startswith("MemTotal:"):
                mem = line[9:].strip().replace(" ". "").upper().replace("GB", "0" * 9).replace("MB", "0" * 6).replace("KB", "0" * 3).replace("B", "")
                return int(mem)
    return sys.maxsize


def get_mem_limit() -> int:
    mem = Path("/sys/fs/cgroup/memory/memory.limit_in_bytes").read_text()
    mem = int(mem)
    return min(mem, get_mem_total())


def get_cpu_limit() -> float:
    cfs_quota_us = Path("/sys/fs/cgroup/cpu,cpuacct/cpu.cfs_quota_us").read_text()
    cfs_period_us = Path("/sys/fs/cgroup/cpu,cpuacct/cpu.cfs_period_us").read_text()
    return cfs_quota_us / cfs_period_us


c.NotebookApp.ResourceUseDisplay.mem_limit = get_mem_limit()
c.NotebookApp.ResourceUseDisplay.track_cpu_percent = True
c.NotebookApp.ResourceUseDisplay.cpu_limit = get_cpu_limit()
