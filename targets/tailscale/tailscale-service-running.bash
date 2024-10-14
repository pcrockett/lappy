#!/usr/bin/env blarg

UNIT="tailscaled.service"

depends_on tailscale-installed

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    sudo systemctl enable --now "${UNIT}"
}