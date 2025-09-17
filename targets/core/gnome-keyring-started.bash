#!/usr/bin/env blarg

UNIT="gnome-keyring-daemon.service"

depends_on gnome-keyring-installed

satisfied_if() {
  test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
  systemctl --user enable --now "${UNIT}"
}
