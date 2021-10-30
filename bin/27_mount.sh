#!/usr/bin/env bash
set -euo pipefail

sudo mkdir -pv $LFS
sudo mount -v -t ext4 /dev/sdb3 $LFS
sudo mkdir -v $LFS/swap
sudo mount -v -t swap /dev/sdb1 $LFS/swap
sudo mkdir -v $LFS/boot
sudo mount -v -t ext4 /dev/sdb2 $LFS/boot
sudo mkdir -v $LFS/home
sudo mount -v -t ext4 /dev/sdb4 $LFS/home
