#!/bin/sh

TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt

sudo fio --directory=$TARGET_PATH \
    --direct=1 \
    --ioengine=libaio \
    --rw=randwrite \
    --bs=4k \
    --size=2500M \
    --time_based=1 \
    --runtime=300 \
    --rate_iops=4000 \
    --numjobs=1 \
    --norandommap=1 \
    --randrepeat=0 \
    --name random
