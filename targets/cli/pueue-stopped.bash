#!/usr/bin/env blarg

UNIT="pueued.service"

satisfied_if() {
  test "$(systemctl --user is-active "${UNIT}")" == "inactive"
}

apply() {
  systemctl --user stop "${UNIT}"
}
