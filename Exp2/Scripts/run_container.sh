#!/bin/bash

# Disk I/O benchmark inside Docker container

mkdir -p ~/fio-test

echo "===== SEQUENTIAL WRITE ====="

docker run --rm \
    -v ~/fio-test:/fio-test \
    vm-container-benchmark \
    fio \
    --name=seq-write \
    --filename=/fio-test/testfile \
    --size=2G \
    --bs=1M \
    --rw=write \
    --direct=1 \
    --iodepth=16 \
    --runtime=30 \
    --time_based

echo "===== RANDOM READ ====="

docker run --rm \
    -v ~/fio-test:/fio-test \
    vm-container-benchmark \
    fio \
    --name=random-read \
    --filename=/fio-test/testfile \
    --size=2G \
    --bs=4k \
    --rw=randread \
    --direct=1 \
    --iodepth=16 \
    --runtime=30 \
    --time_based

echo "Disk benchmark completed."
