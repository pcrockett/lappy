#!/usr/bin/env blarg

SOURCE_CONFIG_FILE="${BLARG_CWD}/config/network/50_wlan.network"
DEST_CONFIG_FILE="/etc/systemd/network/50_wlan.network"

reached_if() {
    files_are_same "${SOURCE_CONFIG_FILE}" "${DEST_CONFIG_FILE}"
}

apply() {
    sudo cp "${SOURCE_CONFIG_FILE}" "${DEST_CONFIG_FILE}"
}