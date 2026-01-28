#!/bin/sh

fio --directory=/home/wei/chlab/nvmevirt/test_script/mnt\
    --direct=1\
    --ioengine=libaio\
    --rw=randwrite\
    --bs=128k\
    --size=2G\
    --io_size=5G\
    --numjobs=1\
    --name write_test
