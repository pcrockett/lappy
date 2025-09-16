#!/usr/bin/env blarg

UNIT="pcscd.socket"

depends_on ykman-installed

satisfied_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled" &&
        test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
    as_root systemctl enable --now "${UNIT}"
}
