#!/usr/bin/env bash
set -euo pipefail

# Set the /bin/sh -> bash

sudo rm /bin/sh
sudo ln -s /bin/bash /bin/sh
