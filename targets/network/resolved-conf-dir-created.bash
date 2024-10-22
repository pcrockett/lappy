#!/usr/bin/env blarg

DIR="/etc/systemd/resolved.conf.d"

reached_if() {
    test -d "${DIR}"
}

apply() {
    sudo mkdir "${DIR}"
}
