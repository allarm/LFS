#!/usr/bin/env bash
set -euo pipefail

grep LFS .profile && echo "LFS is already in .profile"|| echo 'LFS="/mnt/lfs"' >> .profile
sudo grep LFS /etc/environment && echo "LFS is already in /etc/environment" || echo 'LFS="/mnt/lfs"' | sudo tee -a /etc/environment >/dev/null
