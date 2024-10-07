#!/usr/bin/env blarg

DESIRED_SETTING="AutoEnable=false"
CONFIG_FILE="/etc/bluetooth/main.conf"

depends_on bluez-utils-installed

reached_if() {
    grep --line-regexp --fixed-strings "${DESIRED_SETTING}" "${CONFIG_FILE}"
}

apply() {
    sudo sed --in-place "s/^#AutoEnable=true/${DESIRED_SETTING}/" "${CONFIG_FILE}"
    if [ "$(systemctl is-active bluetooth.service)" == "active" ]; then
        sudo systemctl restart bluetooth.service
    fi
}
