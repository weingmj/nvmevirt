#!/bin/sh

MY_NAME=$(hostname)
if [ "$MY_NAME" = "research-pc" ]; then
    TARGET_PATH=/home/wei/nvmevirt/test_script/mnt
else
    TARGET_PATH=/home/wei/chlab/nvmevirt/test_script/mnt
fi


echo "Starting Synchronized Hot/Cold Test..."

# 바뀔 수 있는 파라미터 목록
# time_based & runtime은 묶임 (1, true로 설정하면 runtime 지정 필요)
# size / rate_iops
# 나는 600M / 2100M(합 2.7G) 정도로 hot / cold 나눔
# 디스크 총 크기는 3G로 잡았음

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
size=10G
numjobs=1
time_based=0

[cold_invaliding]
stonewall
rw=randwrite
size=9G
io_size=1G
numjobs=1

[cold_data]
stonewall
size=9G
offset=0
rate_iops=300
time_based=1
runtime=300

[hot_data]
size=1G
offset=9G
rate_iops=10000
time_based=1
runtime=300
EOF