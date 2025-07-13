#!/usr/bin/env blarg

DNS_CONF="/etc/systemd/resolved.conf.d/99_lappy.conf"

satisfied_if() {
    ! test -f "${DNS_CONF}"
}

apply() {
    as_root rm "${DNS_CONF}"
    as_root systemctl restart systemd-resolved.service
}
