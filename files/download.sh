#!/usr/bin/env bash
set -euo pipefail

WGET_FILE=wget-list
LFS=lfs

wget -v \
  --no-check-certificate \
  --input-file="${WGET_FILE}" \
  --continue \
  --directory-prefix="${LFS}"/sources
