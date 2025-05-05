#!/usr/bin/env blarg

UNIT="docker.service"

depends_on docker-installed daemon-config-placed

satisfied_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    as_root systemctl enable --now "${UNIT}"
}
