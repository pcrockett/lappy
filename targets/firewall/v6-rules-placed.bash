#!/usr/bin/env blarg

SOURCE_FILE="${BLARG_CWD}/config/iptables/rules.v6"
DEST_FILE="/etc/iptables/ip6tables.rules"

satisfied_if() {
  files_are_same "${SOURCE_FILE}" "${DEST_FILE}"
}

apply() {
  as_root cp "${SOURCE_FILE}" "${DEST_FILE}"
}
