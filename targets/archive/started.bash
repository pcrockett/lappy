#!/usr/bin/env blarg

UNIT="rclone-archive.service"

depends_on configured

satisfied_if() {
  test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
  systemctl --user enable --now "${UNIT}"
}
