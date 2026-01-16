#!/bin/bash

# 1. Clean up
if [ -f "./test_script/rmmod.sh" ]; then
    ./test_script/rmmod.sh
else
    echo "Error: ./test_script/rmmod.sh not found"
    exit 1
fi

sleep 1

# 2. Load Module
if [ -f "./test_script/insmod.sh" ]; then
    ./test_script/insmod.sh
    if [ $? -ne 0 ]; then
        echo "Error: insmod failed"
        exit 1
    fi
else
    echo "Error: ./test_script/insmod.sh not found"
    exit 1
fi

# 3. Mount
if [ -f "./test_script/mount.sh" ]; then
    sudo ./test_script/mount.sh
else
    echo "Error: ./test_script/mount.sh not found"
    exit 1
fi

# Check result
if mount | grep -q "nvmevirt"; then
    echo "Done."
else
    echo "Mount failed"
    exit 1
fi