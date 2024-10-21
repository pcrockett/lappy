#!/usr/bin/env blarg

UNIT="ip6tables.service"

depends_on v6-rules-placed

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
    sudo systemctl enable --now "${UNIT}"
}
