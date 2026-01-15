#!/bin/sh

fio --directory=/home/wei/chlab/nvmevirt/test_script/mnt --direct=1 --ioengine=io_uring --rw=randread --bs=4k --size=2G --time_based=1 --runtime=20 --numjobs=1 --name read_test --iodepth=4
