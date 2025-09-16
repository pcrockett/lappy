#!/usr/bin/env blarg

UNIT="ip6tables.service"

depends_on v6-rules-placed

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
