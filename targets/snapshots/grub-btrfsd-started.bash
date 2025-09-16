#!/usr/bin/env blarg

UNIT="grub-btrfsd.service"

depends_on grub-btrfsd-configured

satisfied_if() {
  test "$(systemctl is-enabled "${UNIT}")" == "enabled" &&
    test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
  as_root systemctl enable --now "${UNIT}"
}
