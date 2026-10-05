#!/usr/bin/env bash

# Experiment 1 - Hypervisor performance analysis
# Run these commands inside the Ubuntu guest VM
# (same steps on Type-1 and Type-2).

# System Information
hostnamectl
lscpu
free -h
df -h
top -b -n 1 | head -20

# Install and verify Sysbench
sudo apt update
sudo apt install sysbench -y
sysbench --version

# CPU Benchmark
sysbench cpu --cpu-max-prime=20000 run
