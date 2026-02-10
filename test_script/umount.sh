#!/bin/sh

MY_NAME=$(hostname)

if [ "$MY_NAME" = "research-pc" ]; then
    sudo umount /dev/nvme1n1
else
    sudo umount /dev/nvme0n1
fi
