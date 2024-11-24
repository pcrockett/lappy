#!/usr/bin/env blarg

UNIT="dictd.service"

depends_on dictd-installed dictionaries-installed

satisfied_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    as_root systemctl enable --now "${UNIT}"
}
