#!/bin/sh

MY_NAME=$(hostname)
if [ "$MY_NAME" = "research-pc" ]; then
    TARGET_PATH=/home/wei/nvmevirt/test_script/mnt
else
    TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt
fi

fio --directory=$TARGET_PATH --direct=1 --ioengine=io_uring --rw=randread --bs=4k --size=2G --time_based=1 --runtime=20 --numjobs=1 --name read_test --iodepth=4
