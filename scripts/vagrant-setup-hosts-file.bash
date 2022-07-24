#!/bin/bash

set -euo pipefail

cat <<EOF | sudo tee -a /etc/hosts

# KTHW Vagrant machines
10.0.0.10 controller-0
10.0.0.11 controller-1
10.0.0.12 controller-2
10.0.0.20 worker-0
10.0.0.21 worker-1
10.0.0.22 worker-2
EOF

# This is added to get around the DNS issue in Ubuntu
# See https://github.com/kubernetes/kubernetes/issues/66067
sudo ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
