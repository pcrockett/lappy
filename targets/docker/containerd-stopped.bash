#!/usr/bin/env blarg

UNIT="containerd.service"

depends_on docker/daemon-stopped

satisfied_if() {
  test "$(systemctl is-active "${UNIT}")" == "inactive"
}

apply() {
  as_root systemctl stop "${UNIT}"
}
