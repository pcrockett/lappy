#!/usr/bin/env blarg

depends_on wlan-interface-config-placed

SERVICES=(
    systemd-networkd
    systemd-resolved
    iwd
)

reached_if() {
    for service in "${SERVICES[@]}"
    do
        test "$(systemctl is-enabled "${service}.service")" == "enabled" || return 1
        test "$(systemctl is-active "${service}.service")" == "active" || return 1
    done
}

apply() {
    for service in "${SERVICES[@]}"
    do
        sudo systemctl enable --now "${service}.service"
    done
}
