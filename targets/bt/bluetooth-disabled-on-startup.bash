#!/usr/bin/env blarg

UNIT="kill-bluetooth.service"

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
  as_root dd status=none of="/etc/systemd/system/${UNIT}" <<EOF
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
  as_root systemctl daemon-reload
  as_root systemctl enable --now "${UNIT}"
}
