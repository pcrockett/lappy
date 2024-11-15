#!/usr/bin/env blarg

depends_on resolved-conf-dir-created

SOURCE_CONF="${BLARG_CWD}/config/network/mullvad-vanilla-dns.conf"
DEST_CONF="/etc/systemd/resolved.conf.d/99_mullvad.conf"

satisfied_if() {
    test -f "${DEST_CONF}"
}

apply() {
    as_root cp "${SOURCE_CONF}" "${DEST_CONF}"
    as_root systemctl restart systemd-resolved.service
}
