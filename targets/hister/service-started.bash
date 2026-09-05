#!/usr/bin/env blarg

UNIT="hister.service"

depends_on installed configured service-installed

satisfied_if() {
  test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
    && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
  systemctl --user enable --now "${UNIT}"
}
