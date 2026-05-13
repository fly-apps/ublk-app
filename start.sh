#!/bin/bash

modprobe ublk_drv

fallocate -l 512M /tmp/ublk.img
DEV_ID=$(ublk add -t loop -f /tmp/ublk.img | grep -o 'dev id [0-9]\+' | awk '{print $3}')
DEV_NODE="/dev/ublkb${DEV_ID}"

sleep 0.5
mkfs.ext4 -F "${DEV_NODE}"
mkdir -p /mnt/ublk
mount "${DEV_NODE}" /mnt/ublk

echo "Mounted sparse-backed disk at /mnt/ublk."

sleep inf
