#!/usr/bin/env blarg

UNIT="kill-bluetooth.service"

reached_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
    sudo dd status=none of="/etc/systemd/system/${UNIT}" <<EOF
[Unit]
Description=Kill bluetooth on startup
Wants=bluetooth.target

[Service]
Type=oneshot
ExecStart=/usr/bin/rfkill block bluetooth

[Install]
WantedBy=default.target sleep.target
EOF
    sudo systemctl daemon-reload
    sudo systemctl enable --now "${UNIT}"
}
