#!/usr/bin/env blarg

UNIT="pueued.service"

depends_on pueue-installed pueue-configured

satisfied_if() {
  test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
  systemctl --user enable --now "${UNIT}"
}
