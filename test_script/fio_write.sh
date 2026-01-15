#!/bin/sh

fio --directory=/home/wei/chlab/nvmevirt/test_script/mnt --direct=1 --ioengine=libaio --rw=write --bs=128k --size=2G --numjobs=1 --name write_test
