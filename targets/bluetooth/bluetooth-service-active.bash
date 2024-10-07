#!/usr/bin/env blarg

SERVICE="bluetooth.service"

depends_on bluez-utils-installed

reached_if() {
    test "$(systemctl is-active "${SERVICE}")" == "active" \
        && test "$(systemctl is-enabled "${SERVICE}")" == "enabled"
}

apply() {
    sudo systemctl enable --now "${SERVICE}"
}
