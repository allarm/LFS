#!/usr/bin/env bash
set -euo pipefail

sudo mkswap /dev/sdb1
sudo mkfs -v -t ext4 /dev/sdb2
sudo mkfs -v -t ext4 /dev/sdb3
sudo mkfs -v -t ext4 /dev/sdb4
