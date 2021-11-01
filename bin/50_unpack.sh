#!/usr/bin/env bash
set -euo pipefail

mkdir -p "${UNPACKED}"

COUNT=$(ls | grep "xz$\|gz$\|bz2$" | wc -l)

for F in *; do
  if [[ $F =~ .*xz$|.*gz$|.*bz2 ]]; then
    echo $F
  fi
done
