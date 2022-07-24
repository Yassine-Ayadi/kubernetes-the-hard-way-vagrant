#!/bin/bash

set -euo pipefail

apt-get update
apt-get install -y net-tools

case "$(hostname)" in
worker-0)
  route add -net 10.21.0.0/16 gw 10.0.0.21
  route add -net 10.22.0.0/16 gw 10.0.0.22
  ;;
worker-1)
  route add -net 10.20.0.0/16 gw 10.0.0.20
  route add -net 10.22.0.0/16 gw 10.0.0.22
  ;;
worker-2)
  route add -net 10.20.0.0/16 gw 10.0.0.20
  route add -net 10.21.0.0/16 gw 10.0.0.21
  ;;
*)
  route add -net 10.20.0.0/16 gw 10.0.0.20
  route add -net 10.21.0.0/16 gw 10.0.0.21
  route add -net 10.22.0.0/16 gw 10.0.0.22
  ;;
esac
