#!/bin/bash

echo 1 > /sys/class/block/sda/device/rescan
sleep 2
GROWPART_OUT=`growpart /dev/sda 1`
if [ $? -eq 0 ]; then
    echo "trying to resize fs"
    echo $GROWPART_OUT
    resize2fs /dev/sda1
    echo "resize done"
fi
