#!/usr/bin/env bash
set -euo pipefail

cat > /home/"${LFS_USER}"/.bash_profile << "EOF"
exec env -i HOME=$HOME TERM=$TERM PS1='\u:\w\$ ' /bin/bash
EOF

cat > /home/"${LFS_USER}"/.bashrc << EOF
set +h
umask 022
LFS=$LFS
LC_ALL=POSIX
EOF

cat >> /home/"${LFS_USER}"/.bashrc << "EOF"
LFS_TGT=$(uname -m)-lfs-linux-gnu
PATH=/usr/bin
if [ ! -L /bin ]; then PATH=/bin:$PATH; fi
EOF

cat >> /home/"${LFS_USER}"/.bashrc << EOF
PATH=$LFS/tools/bin:$PATH
CONFIG_SITE=$LFS/usr/share/config.site
export LFS LC_ALL LFS_TGT PATH CONFIG_SITE
EOF

chown "${LFS_USER}":"${LFS_GROUP}" /home/"${LFS_USER}/.bash_profile"
chown "${LFS_USER}":"${LFS_GROUP}" /home/"${LFS_USER}/.bashrc"
