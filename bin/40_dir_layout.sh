#!/usr/bin/env bash
set -euo pipefail

sudo mkdir -pv "${LFS}"/sources
sudo chmod -v a+wt $LFS/sources

sudo mkdir -pv $LFS/{etc,var} $LFS/usr/{bin,lib,sbin}

for i in bin lib sbin; do
  sudo ln -sv usr/$i $LFS/$i
done

case $(uname -m) in
  x86_64) sudo mkdir -pv $LFS/lib64 ;;
esac
