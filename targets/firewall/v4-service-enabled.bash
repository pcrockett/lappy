#!/usr/bin/env blarg

UNIT="iptables.service"

depends_on v4-rules-placed

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
