#!/usr/bin/env blarg

UNIT="docker.service"

depends_on docker-installed

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    sudo systemctl enable --now "${UNIT}"
}
