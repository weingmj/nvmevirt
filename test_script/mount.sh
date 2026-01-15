#!/bin/sh

sudo mkfs.ext4 -F /dev/nvme0n1

sudo mount /dev/nvme0n1 /home/wei/chlab/nvmevirt/test_script/mnt

sudo chown wei:wei /home/wei/chlab/nvmevirt/test_script/mnt

