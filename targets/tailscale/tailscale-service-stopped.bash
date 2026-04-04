#!/usr/bin/env blarg

UNIT="tailscaled.service"

depends_on tailscale-down

satisfied_if() {
  ! command -v tailscale \
    || test "$(systemctl is-active "${UNIT}")" == "inactive"
}

apply() {
  as_root systemctl stop "${UNIT}"
}
