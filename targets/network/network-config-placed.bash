#!/usr/bin/env blarg

FILES=(
    20-wlan
    20-wwan
    20-ethernet
)
SOURCE_CONFIG_DIR="${BLARG_CWD}/config/network"
DEST_CONFIG_DIR="/etc/systemd/network"

satisfied_if() {
    for f in "${FILES[@]}"; do
        files_are_same "${SOURCE_CONFIG_DIR}/${f}.network" "${DEST_CONFIG_DIR}/${f}.network"
    done
}

apply() {
    for f in "${FILES[@]}"; do
        as_root cp "${SOURCE_CONFIG_DIR}/${f}.network" "${DEST_CONFIG_DIR}/${f}.network"
    done
    as_root systemctl restart systemd-networkd.service
}
