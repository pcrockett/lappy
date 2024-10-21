#!/usr/bin/env blarg

SOURCE_FILE="${BLARG_CWD}/config/iptables/rules.v6"
DEST_FILE="/etc/iptables/ip6tables.rules"

reached_if() {
    files_are_same "${SOURCE_FILE}" "${DEST_FILE}"
}

apply() {
    sudo cp "${SOURCE_FILE}" "${DEST_FILE}"
}
