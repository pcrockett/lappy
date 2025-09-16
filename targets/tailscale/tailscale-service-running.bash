#!/usr/bin/env blarg

UNIT="tailscaled.service"

depends_on tailscale-installed

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled" &&
    test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
