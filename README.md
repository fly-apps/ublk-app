# ublk on Fly.io Machines Demo

This repository is a demo showing how to use `ublk` on Fly.io Machines.

It contains a minimal Fly.io app setup that can be used to experiment with [userspace block devices][ublk] inside a Fly Machine.

[ublk]: https://docs.kernel.org/block/ublk.html

## Files

- `Dockerfile` — container image definition
- `fly.toml` — Fly.io app configuration
- `start.sh` — startup script for the Machine

## Inside the machine

```
root@683d470b491268:/# ublk list
dev id 0: nr_hw_queues 1 queue_depth 128 block size 4096 dev_capacity 1048576
 max rq size 524288 daemon pid 652 state LIVE
 flags 0x42 [ URING_CMD_COMP_IN_TASK CMD_IOCTL_ENCODE ]
 ublkc: 247:0 ublkb: 259:0 owner: 0:0
 queue 0: tid 655 affinity(0 )
 target {"backing_file":"/tmp/ublk.img","dev_size":536870912,"direct_io":1,"name":"loop","offset":0,"type":0}

root@683d470b491268:/# mount |grep ublk
/dev/ublkb0 on /mnt/ublk type ext4 (rw,relatime)

root@683d470b491268:/# lsmod
Module                  Size  Used by
ublk_drv               32768  3

root@683d470b491268:/# ls /dev/ublk* -l
crw------- 1 root root  10, 260 May 13 20:05 /dev/ublk-control
brw------- 1 root root 259,   0 May 13 20:05 /dev/ublkb0
crw------- 1 root root 247,   0 May 13 20:05 /dev/ublkc0
```
