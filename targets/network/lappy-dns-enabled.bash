#!/usr/bin/env blarg

depends_on resolved-conf-dir-created

DNS_PROFILE="${DNS_PROFILE:-"mullvad-vanilla"}"
SOURCE_CONF="${BLARG_CWD}/config/network/${DNS_PROFILE}-dns.conf"
DEST_CONF="/etc/systemd/resolved.conf.d/99_lappy.conf"

satisfied_if() {
    test -f "${DEST_CONF}" && files_are_same "${SOURCE_CONF}" "${DEST_CONF}"
}

apply() {
    as_root cp "${SOURCE_CONF}" "${DEST_CONF}"
    as_root systemctl restart systemd-resolved.service
}
