#!/usr/bin/env blarg

depends_on resolved-conf-dir-created

SOURCE_CONF="${BLARG_CWD}/config/network/dns-defaults.conf"
DEST_CONF="/etc/systemd/resolved.conf.d/10_defaults.conf"

satisfied_if() {
  test -f "${DEST_CONF}" && files_are_same "${SOURCE_CONF}" "${DEST_CONF}"
}

apply() {
  as_root cp "${SOURCE_CONF}" "${DEST_CONF}"
  as_root systemctl restart systemd-resolved.service
}
