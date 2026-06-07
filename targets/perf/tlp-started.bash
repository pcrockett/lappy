#!/usr/bin/env blarg

UNIT="tlp.service"

depends_on tlp-installed tlp-config-placed

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
