#!/usr/bin/env blarg

UNIT="unclutter.service"
TIMEOUT_SECONDS=2

depends_on unclutter-installed

satisfied_if() {
    test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
    cat > "${HOME}/.config/systemd/user/${UNIT}" <<EOF
[Unit]
Description=Hide mouse after inactivity

[Service]
Type=exec
ExecStart=/usr/bin/unclutter --timeout ${TIMEOUT_SECONDS}

[Install]
WantedBy=default.target
EOF
    systemctl --user daemon-reload
    systemctl --user enable --now "${UNIT}"
}
