#!/usr/bin/env blarg

targets=(
  @pcrockett:archlinux/iptables-firewall/main
)

depends_on "${targets[@]}"
