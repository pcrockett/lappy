#!/usr/bin/env blarg

UNIT="kill-bluetooth.service"

satisfied_if() {
    test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
    sudo dd status=none of="/etc/systemd/system/${UNIT}" <<EOF
[Unit]
Description=Kill bluetooth
Wants=bluetooth.target
After=bluetooth.target

[Service]
Type=oneshot
ExecStart=/usr/bin/rfkill block bluetooth

[Install]
WantedBy=default.target
EOF
    sudo systemctl daemon-reload
    sudo systemctl enable --now "${UNIT}"
}
