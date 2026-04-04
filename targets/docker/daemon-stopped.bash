#!/usr/bin/env blarg

UNIT="docker.service"

depends_on socket-stopped

satisfied_if() {
  test "$(systemctl is-active "${UNIT}")" == "inactive"
}

apply() {
  as_root systemctl stop "${UNIT}"
}
