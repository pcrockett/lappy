#!/usr/bin/env blarg

DNS_CONF="/etc/systemd/resolved.conf.d/99_mullvad.conf"

reached_if() {
    ! test -f "${DNS_CONF}"
}

apply() {
    sudo rm "${DNS_CONF}"
    sudo systemctl restart systemd-resolved.service
}
