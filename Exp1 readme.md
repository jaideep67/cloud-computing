# Performance Analysis of Type-1 and Type-2 Hypervisors

## Proxmox VE vs VMware Workstation

This project experimentally compares the CPU performance of two different virtualization approaches:

* **Type-1 Hypervisor:** Proxmox VE
* **Type-2 Hypervisor:** VMware Workstation

The experiment uses identically configured Ubuntu virtual machines and the **Sysbench CPU benchmark** to measure and compare their performance.





---

## 📌 Objective

The main objective of this experiment is to analyze the performance difference between:

**Type-1 Hypervisor → Proxmox VE**

and

**Type-2 Hypervisor → VMware Workstation**

The same virtual machine resources are allocated to both environments so that the effect of the hypervisor type can be studied more fairly.

---

## 🏗️ Experimental Setup

Both virtual machines use the following configuration:

| Parameter              | Configuration |
| ---------------------- | ------------- |
| Guest Operating System | Ubuntu        |
| Virtual CPUs           | 2 vCPU        |
| Memory                 | 2 GB          |
| Virtual Disk           | 20 GB         |
| CPU Benchmark          | Sysbench      |
| CPU Prime Limit        | 20,000        |

---

## 🔧 Technologies Used

* Proxmox VE
* VMware Workstation
* Ubuntu
* Sysbench
* Linux
* Virtualization
* CPU Performance Benchmarking

---

## 🖥️ Hypervisor Architecture

### Type-1 Hypervisor — Proxmox VE

Proxmox VE runs directly on the physical server hardware and provides virtualization services to the guest virtual machines.

```text
Physical Hardware
       │
       ▼
   Proxmox VE
   Type-1
       │
       ▼
 Ubuntu Virtual Machine
    2 vCPU
    2 GB RAM
    20 GB Disk
```
<img width="2064" height="1332" alt="image" src="https://github.com/user-attachments/assets/3c18f002-6b6b-4a19-9e93-57e5f11bfbba" />




### Type-2 Hypervisor — VMware Workstation

VMware Workstation runs on top of a host operating system and provides virtualization to the guest VM.

```text
Physical Hardware
       │
       ▼
 Host Operating System
       │
       ▼
VMware Workstation
      Type-2
       │
       ▼
 Ubuntu Virtual Machine
    2 vCPU
    2 GB RAM
    20 GB Disk
```
<img width="2024" height="1084" alt="image" src="https://github.com/user-attachments/assets/57580bb5-c0ae-4f48-a4da-b7df562b23b8" />

---

## ⚙️ Benchmark Methodology

The same CPU benchmark is executed inside both Ubuntu virtual machines:

```bash
sysbench cpu --cpu-max-prime=20000 run
```

The benchmark results are collected for both hypervisors.

The following performance metrics are recorded:

* Total execution time
* Total number of events
* Events per second
* Minimum latency
* Average latency
* Maximum latency

---

## 📊 Performance Metrics

### 1. Total Execution Time

Measures how long Sysbench takes to complete the CPU workload.

**Lower execution time indicates faster completion of the benchmark.**

### 2. Total Events

Represents the total number of CPU benchmark events completed during the test.

### 3. Events Per Second

Measures how many benchmark events are processed per second.

**Higher events/sec indicates higher benchmark throughput.**

### 4. Latency

Latency represents the time required to process individual benchmark events.

The experiment records:

* Minimum latency
* Average latency
* Maximum latency

---

## 📈 Results

Record the actual Sysbench results obtained from your two VMs in the following table.

| Metric               | Proxmox VE (Type-1) | VMware Workstation (Type-2) |
| -------------------- | ------------------: | --------------------------: |
| Total Execution Time |                 TBD |                         TBD |
| Total Events         |                 TBD |                         TBD |
| Events/sec           |                 TBD |                         TBD |
| Minimum Latency      |                 TBD |                         TBD |
| Average Latency      |                 TBD |                         TBD |
| Maximum Latency      |                 TBD |                         TBD |

> **Note:** Replace `TBD` with the actual values obtained from Sysbench.

---

## 📊 Performance Graphs

The recommended graphs for this experiment are:

### Graph 1 — Events per Second

Compare the CPU throughput of Proxmox VE and VMware Workstation.

<img width="1462" height="872" alt="image" src="https://github.com/user-attachments/assets/19133c9a-51be-4ed9-8a1e-9478b5d82d48" />


### Graph 2 — Total Execution Time

Compare how long each virtual machine takes to complete the same CPU workload.

<img width="1464" height="878" alt="image" src="https://github.com/user-attachments/assets/f704bc65-300f-4fa4-850f-135fd8eb7f70" />


### Graph 3 — Average Latency

Compare the average time required to process benchmark events.

<img width="1468" height="946" alt="image" src="https://github.com/user-attachments/assets/413a7a51-5972-4cd4-8795-29a5f669f40f" />
<img width="1470" height="898" alt="image" src="https://github.com/user-attachments/assets/197303d6-9ade-4c3e-b734-98e4e0d1ed06" />



### Graph 4 — Resource Utilization

If CPU and memory observations are collected using `top`, Proxmox VE and VMware Workstation can also be compared using:

* CPU utilization
* Memory utilization
* Load average

<img width="1472" height="860" alt="image" src="https://github.com/user-attachments/assets/0c921ffb-f36b-4316-95f0-d633fd42a810" />


---

## 🔬 Resource Monitoring

Linux `top` is used to observe:

* CPU utilization
* Memory utilization
* Running processes
* Load average

The manual also recommends monitoring the VM from the respective hypervisor interfaces.

For Proxmox VE, VM resources can be observed from:

```text
Datacenter
   └── Proxmox Node
          └── Virtual Machine
                 └── Summary
```

For VMware Workstation, the VM hardware configuration can be checked through:

```text
VM → Settings
```

---

## 🧪 Experimental Procedure

### Proxmox VE

1. Create an Ubuntu VM in Proxmox VE.
2. Configure 2 vCPU.
3. Allocate 2 GB RAM.
4. Allocate 20 GB disk.
5. Install Ubuntu.
6. Verify CPU and memory configuration.
7. Install Sysbench.
8. Run the CPU benchmark.
9. Record performance metrics.
10. Monitor CPU and memory utilization.

### VMware Workstation

1. Create an Ubuntu VM in VMware Workstation.
2. Configure 2 vCPU.
3. Allocate 2 GB RAM.
4. Allocate 20 GB disk.
5. Install Ubuntu.
6. Verify CPU and memory configuration.
7. Install Sysbench.
8. Run the same CPU benchmark.
9. Record performance metrics.
10. Monitor CPU and memory utilization.

Both workflows are specified in the laboratory manual.

---

## 🎯 Expected Analysis

The experiment is designed to determine how the virtualization architecture affects CPU benchmark performance when the guest VM resources are kept the same.

The comparison should be based on the measured:

* Execution time
* Events/sec
* Total events
* Latency
* CPU utilization
* Memory utilization

The final conclusion should be written **only after collecting the actual benchmark results**.






## 🚀 Conclusion

This experiment provides a controlled comparison between Type-1 and Type-2 virtualization by running the same Ubuntu workload with the same virtual CPU, memory, and disk configuration.

Sysbench CPU benchmarking is used to collect quantitative performance measurements, while Linux and hypervisor monitoring tools provide additional resource-utilization observations.

The final performance conclusion should be based on the actual experimental measurements collected from Proxmox VE and VMware Workstation.

