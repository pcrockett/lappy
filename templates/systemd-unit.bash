#!/usr/bin/env blarg

UNIT="TODO.service"

depends_on TODO-installed

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    sudo systemctl enable --now "${UNIT}"
}
