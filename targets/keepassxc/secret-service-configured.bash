#!/usr/bin/env blarg

depends_on keepassxc-installed

SECRET_SERVICE_FILE="${XDG_DATA_HOME:-$HOME/.local/share}/dbus-1/services/org.freedesktop.secrets.service"

reached_if() {
    test -f "${SECRET_SERVICE_FILE}"
}

apply() {
    mkdir --parent "$(dirname "${SECRET_SERVICE_FILE}")"
    cat >> "${SECRET_SERVICE_FILE}" <<EOF
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/keepassxc
EOF
}
