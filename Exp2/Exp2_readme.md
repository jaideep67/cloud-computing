# Performance Analysis of Virtual Machines and Containers

## Abstract

This project presents a practical performance analysis of a Virtual Machine (VM) environment and a Docker container environment under controlled workloads.

The experiments were conducted on a Windows host using VMware to run Ubuntu 22.04.

The comparison covers:

- CPU baseline performance
- Memory performance
- Disk I/O performance
- Application-level performance using FastAPI

The VM and Docker workloads were executed inside the same Ubuntu environment, with Docker constrained to the same 4-vCPU and 7.7-GiB-memory resource limits used for the controlled comparison.

All measured benchmark outputs were preserved as raw text files.

The results were then processed into CSV files and comparative graphs to support analysis and reproducibility.

---

# Objectives

The objectives of this experiment are:

- To compare VM and container performance under controlled workloads.
- To measure CPU performance using Sysbench.
- To measure memory performance using repeated Sysbench runs.
- To evaluate sequential and random disk I/O using fio.
- To evaluate application-level performance using a FastAPI application.
- To preserve raw benchmark outputs for reproducibility.
- To process benchmark outputs into structured CSV files.
- To generate graphs for visual comparison of measured results.
- To document the experimental environment, methodology, results, and limitations.

---

# Research Questions

The experiment investigates the following questions:

1. How does memory performance differ between the VM and Docker container environments?
2. How does disk I/O performance vary between sequential and random workloads?
3. How does the FastAPI application perform in the VM and Docker environments?
4. What performance differences are observed when the container is given controlled CPU and memory limits comparable to the VM configuration?

---

# Experimental Environment

## Hardware Configuration

| Component | Configuration |
|---|---|
| Host machine | Windows host |
| Virtualization software | VMware |
| Guest operating system | Ubuntu 22.04 |
| VM CPU allocation | 4 vCPU |
| VM memory allocation | 7.7 GiB RAM |
| Virtual disk | Approximately 54 GB |

---

## Software Configuration

Docker was installed and executed inside the Ubuntu 22.04 VM.

The container was run with the following resource limits:

| Resource | Docker Limit |
|---|---:|
| CPUs | 4 |
| Memory | 7.7 GiB |

This allowed the Docker workloads to be tested under controlled CPU and memory limits inside the same Ubuntu VM.

---

# Architecture

The experimental setup can be summarized as follows:

```text
                         Windows Host
                              |
                              v
                           VMware
                              |
                              v
                       Ubuntu 22.04 VM
                      4 vCPU / 7.7 GiB RAM
                              |
                    +---------+---------+
                    |                   |
                    v                   v
           Native VM Environment   Docker Container
                    |                   |
                    +---------+---------+
                              |
                              v
                       Common Workloads
                              |
              +---------------+---------------+
              |               |               |
              v               v               v
           Memory          Disk I/O         FastAPI
          Sysbench           fio            Apache ab
              |               |               |
              +---------------+---------------+
                              |
                              v
                         Raw Results
                              |
                              v
                      Processed CSV Files
                              |
                              v
                      Comparison Graphs
