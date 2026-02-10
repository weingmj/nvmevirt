#!/bin/sh

MY_NAME=$(hostname)

if [ "$MY_NAME" = "research-pc" ]; then

    sudo mkfs.ext4 -F /dev/nvme1n1

    sudo mount /dev/nvme1n1 /home/wei/nvmevirt/test_script/mnt

    sudo chown wei:wei /home/wei/nvmevirt/test_script/mnt
else 
    sudo mkfs.ext4 -F /dev/nvme0n1

    sudo mount /dev/nvme0n1 /home/wei/chlab/nvmevirt/test_script/mnt

    sudo chown wei:wei /home/wei/chlab/nvmevirt/test_script/mnt
fi