#!/usr/bin/env blarg

DIR="/etc/systemd/resolved.conf.d"

satisfied_if() {
    test -d "${DIR}"
}

apply() {
    as_root mkdir "${DIR}"
}
