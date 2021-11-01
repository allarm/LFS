#!/usr/bin/env bash
set -euo pipefail

groupadd -f "${LFS_GROUP}"
# -s default shell
# -g group
# -m create a home directory
# -k input for skeleton (default is /etc/skel)
if ! id "${LFS_USER}" &>/dev/null; then
  useradd -s /bin/bash -g "${LFS_GROUP}" -m -k /dev/null "${LFS_USER}"
else
  echo "User ${LFS_USER} already exists."
fi
echo "${LFS_USER}:${LFS_PASS}" | chpasswd
