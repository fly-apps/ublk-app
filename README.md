# ublk on Fly.io Machines Demo

This repository is a demo showing how to use `ublk` on Fly.io Machines.

It contains a minimal Fly.io app setup that can be used to experiment with userspace block devices inside a Fly Machine.

## Links

- [ublk kernel documentation](https://docs.kernel.org/block/ublk.html)

## Files

- `Dockerfile` — container image definition
- `fly.toml` — Fly.io app configuration
- `start.sh` — startup script for the Machine

## Deploy

```sh
fly deploy
```

## Purpose

This app is intended as a demonstration of running `ublk` with Fly.io Machines, not as a production-ready application.
