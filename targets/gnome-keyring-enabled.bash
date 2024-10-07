#!/usr/bin/env blarg

SERVICE_NAME="gnome-keyring-daemon"

depends_on gnome-keyring-installed

reached_if() {
    test "$(systemctl is-enabled --user "${SERVICE_NAME}")" == "enabled" \
        && test "$(systemctl is-active --user "${SERVICE_NAME}")" == "active"
}

apply() {
    systemctl enable --user --now "${SERVICE_NAME}"
}
