#!/bin/bash

MY_NAME=$(hostname)

# check nvmev.ko exists
if [ ! -f "./nvmev.ko" ]; then
    echo "Error: no nvmev.ko; make first"
    exit 1
fi

# set address with computer-name
if [ "$MY_NAME" == "weicom" ]; then
#desktop
    START_ADDR="4G"
    SIZE="3G"
    echo ">> [Desktop Mode]: Start=4G, Size=3G"
else
#notebook
    START_ADDR="4G"
    SIZE="3G"
    echo ">> [Laptop Mode]: Start=4G, Size=3G"
fi

# to reload, remove existing module
if lsmod | grep -q "nvmev"; then
    echo ">> 기존 모듈 제거 중..."
    sudo rmmod nvmev
fi

# load module
echo ">> 모듈 로드 중..."
sudo insmod ./nvmev.ko memmap_start=$START_ADDR memmap_size=$SIZE cpus=1,2

# result
if [ $? -eq 0 ]; then
    echo "Success"
    dmesg | tail -n 2
else
    echo "Failed"
fi