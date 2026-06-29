#!/usr/bin/env blarg

UNIT="keyd.service"

depends_on keyd-installed keyd-configured

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
