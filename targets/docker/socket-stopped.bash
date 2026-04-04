#!/usr/bin/env blarg

UNIT="docker.socket"

satisfied_if() {
  test "$(systemctl is-active "${UNIT}")" == "inactive"
}

apply() {
  as_root systemctl stop "${UNIT}"
}
