#!/usr/bin/env blarg

depends_on network-config-placed

SERVICES=(
    systemd-networkd
    systemd-resolved
    iwd
)

satisfied_if() {
    for service in "${SERVICES[@]}"; do
        test "$(systemctl is-enabled "${service}.service")" == "enabled" || return 1
        test "$(systemctl is-active "${service}.service")" == "active" || return 1
    done
}

apply() {
    for service in "${SERVICES[@]}"; do
        as_root systemctl enable --now "${service}.service"
    done
}
