import matplotlib.pyplot as plt
import os

# Create output directory
os.makedirs("results/figures", exist_ok=True)

# ============================================================
# CPU PERFORMANCE
# ============================================================

threads = [1, 2, 4, 8]

run1_cpu = [1758.83, 3517.35, 6617.20, 6389.73]
run2_cpu = [1733.59, 3513.60, 6826.48, 6523.44]

plt.figure(figsize=(8, 5))

plt.plot(threads, run1_cpu, marker="o", label="Run 1")
plt.plot(threads, run2_cpu, marker="o", label="Run 2")

plt.title("CPU Performance vs Number of Threads")
plt.xlabel("Number of Threads")
plt.ylabel("Events per Second")
plt.xticks(threads)
plt.grid(True)
plt.legend()

plt.savefig(
    "results/figures/cpu_performance.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()


# ============================================================
# RANDOM READ PERFORMANCE
# ============================================================

runs = ["Run 1", "Run 2"]
random_read = [57.3, 58.0]

plt.figure(figsize=(7, 5))

plt.bar(runs, random_read)

plt.title("Docker Random Read Performance")
plt.xlabel("Run")
plt.ylabel("Bandwidth (MiB/s)")

plt.savefig(
    "results/figures/random_read.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()


# ============================================================
# SEQUENTIAL WRITE PERFORMANCE
# ============================================================

seq_write = [1623.0, 1429.0]

plt.figure(figsize=(7, 5))

plt.bar(runs, seq_write)

plt.title("Docker Sequential Write Performance")
plt.xlabel("Run")
plt.ylabel("Bandwidth (MiB/s)")

plt.savefig(
    "results/figures/sequential_write.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()


# ============================================================
# DISK PERFORMANCE COMPARISON
# ============================================================

random_read = [57.3, 58.0]
sequential_write = [1623.0, 1429.0]

plt.figure(figsize=(8, 5))

x = range(len(runs))
width = 0.35

plt.bar(
    [i - width / 2 for i in x],
    random_read,
    width=width,
    label="Random Read"
)

plt.bar(
    [i + width / 2 for i in x],
    sequential_write,
    width=width,
    label="Sequential Write"
)

plt.title("Docker Disk I/O Performance")
plt.xlabel("Run")
plt.ylabel("Bandwidth (MiB/s)")
plt.xticks(list(x), runs)
plt.legend()

plt.savefig(
    "results/figures/disk_performance.png",
    dpi=300,
    bbox_inches="tight"
)

plt.show()

print("All graphs generated successfully.")
print("Graphs saved in: results/figures/")
