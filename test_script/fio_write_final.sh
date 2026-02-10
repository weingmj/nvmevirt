#!/bin/sh

TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt

echo "Starting Synchronized Hot/Cold Test (Scaled 9:1 Ratio)..."

# [비율 유지 스케일링]
# Server: Cold 9G : Hot 1G (Total 10G used on 12G disk)
# Local : Cold 2.25G : Hot 0.25G (Total 2.5G used on 3G disk)

sudo fio - <<EOF
[global]
directory=$TARGET_PATH
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
size=2500M
io_size=250M
numjobs=1

[cold_data]
stonewall
size=2500M
offset=0
rate_iops=50
time_based=1
runtime=300

[hot_data]
size=200M
offset=2500M
rate_iops=3000
time_based=1
runtime=300
EOF