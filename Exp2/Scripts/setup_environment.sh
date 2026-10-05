#!/bin/bash

# Environment preparation for VM vs Container performance experiment

mkdir -p ~/vm-vs-container-performance
cd ~/vm-vs-container-performance

mkdir -p docs results/raw results/processed results/figures scripts workloads

echo "===== SYSTEM INFORMATION ====="
echo "CPU:"
nproc

echo "Memory:"
free -h

echo "CPU Details:"
lscpu | grep -E '^CPU\(s\)|^Core|^Socket'

echo "===== INSTALLING BENCHMARK TOOLS ====="

sudo apt update

sudo apt install -y \
sysbench \
fio \
iperf3 \
htop \
iotop \
sysstat \
python3 \
python3-pip \
git \
curl

echo "===== TOOL VERSIONS ====="

sysbench --version
fio --version
iperf3 --version
python3 --version
git --version

echo "===== INSTALLING DOCKER ====="

sudo apt install -y docker.io
sudo systemctl enable --now docker

sudo docker --version

echo "===== TESTING DOCKER ====="

sudo docker run --rm hello-world

echo "===== ADDING USER TO DOCKER GROUP ====="

sudo usermod -aG docker $USER

echo "Environment setup completed."

echo "===== BUILDING BENCHMARK IMAGE ====="

docker build -t vm-container-benchmark -f docker/Dockerfile .

echo "===== BUILDING FASTAPI IMAGE ====="

docker build -t performance-api -f api/Dockerfile api

echo "Setup completed successfully."
