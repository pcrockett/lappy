#!/usr/bin/env blarg

UNIT="iptables.service"

depends_on v4-rules-placed

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
    sudo systemctl enable --now "${UNIT}"
}
