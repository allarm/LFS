#!/usr/bin/env bash
set -euo pipefail

pushd $LFS/sources
tar -xf ./*.tar
pushd $PACKAGES_VERSION
md5sum -c md5sums
popd
popd
