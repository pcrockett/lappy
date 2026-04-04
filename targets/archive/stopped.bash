#!/usr/bin/env blarg

UNIT="rclone-archive.service"

satisfied_if() {
  test "$(systemctl --user is-active "${UNIT}")" == "inactive"
}

apply() {
  systemctl --user stop "${UNIT}"
}
