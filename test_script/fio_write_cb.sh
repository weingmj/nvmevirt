#!/bin/sh

MY_NAME=$(hostname)
if [ "$MY_NAME" = "research-pc" ]; then
    TARGET_PATH=/home/wei/nvmevirt/test_script/mnt
else
    TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt
fi

echo "Starting Synchronized Hot/Cold Test..."

sudo fio - <<EOF
[global]
directory=$TARGET_PATH
filename=fiotest.dat
ioengine=libaio
direct=1
bs=4k
group_reporting
rw=randwrite
norandommap=1

[prepare_fill]
rw=write
offset=0
size=2700M
numjobs=1
time_based=0

[cold_invaliding]
stonewall
rw=randwrite
offset=0
size=2250M
io_size=250M
numjobs=1

[hot_invaliding]
rw=randwrite
offset=2250M
size=450M
io_size=300M
numjobs=1

[cold_data]
stonewall
size=2250M
offset=0
rate_iops=50
time_based=1
runtime=300

[hot_data]
size=450M
offset=2250M
rate_iops=4000
time_based=1
runtime=300
EOF