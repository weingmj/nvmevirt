#!/bin/bash

MY_NAME=$(hostname)

# check nvmev.ko exists
if [ ! -f "./nvmev.ko" ]; then
    echo "Error: no nvmev.ko; make first"
    exit 1
fi

# set address with computer-name
if [ "$MY_NAME" == "research-pc" ]; then
#research-pc
    START_ADDR="4G"
    SIZE="12G"
    echo ">> [research-pc Mode]: Start=4G, Size=12G"
else
#notebook, desktop, etc
    START_ADDR="4G"
    SIZE="3G"
    echo ">> [Default Mode]: Start=4G, Size=3G"
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
else
    echo "Failed"
fi
