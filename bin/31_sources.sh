#!/usr/bin/env bash
set -euo pipefail

get_files_len() {
  # Informational
  wget --no-check-certificate \
    --input-file="${WGET_FILE}" \
    --spider \
    2>&1 | grep Length
}

download_files() {
  wget -q \
    --no-check-certificate \
    --input-file="${WGET_FILE}" \
    --continue \
    --directory-prefix="${LFS}"/sources
}

WGET_FILE=$LFS/sources/wget-list
MIRROR=https://mirror.tochlab.net

echo "Downloading MD5SUMS..."

cat > "${WGET_FILE}" <<EOF
${MIRROR}/pub/lfs/lfs-packages/MD5SUMS
EOF

get_files_len
download_files

echo "Downloading lfs-packages..."

cat > "${WGET_FILE}" <<EOF
${MIRROR}/pub/lfs/lfs-packages/lfs-packages-${PACKAGES_VERSION}.tar
EOF

get_files_len
download_files
