#!/usr/bin/env blarg

depends_on resolved-conf-dir-created

SOURCE_CONF="${BLARG_CWD}/config/network/mullvad-vanilla-dns.conf"
DEST_CONF="/etc/systemd/resolved.conf.d/99_mullvad.conf"

reached_if() {
    test -f "${DEST_CONF}"
}

apply() {
    sudo cp "${SOURCE_CONF}" "${DEST_CONF}"
    sudo systemctl restart systemd-resolved.service
}
