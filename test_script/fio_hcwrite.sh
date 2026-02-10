#!/bin/sh

MY_NAME=$(hostname)
if [ "$MY_NAME" = "research-pc" ]; then
    TARGET_PATH=/home/wei/nvmevirt/test_script/mnt
else
    TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt
fi

sudo fio --directory=$TARGET_PATH \
    --direct=1 \
    --ioengine=libaio \
    --rw=randwrite \
    --bs=4k \
    --size=2700M \
    --io_size=30G \
    --numjobs=1 \
    --norandommap=1 \
    --randrepeat=0 \
    --random_distribution=zipf:0.8 \
    --name please