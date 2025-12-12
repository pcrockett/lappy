#!/usr/bin/env blarg
#
# This target isn't actually necessary MOST of the time, since we use socket activation
# for day-to-day use.
#
# However to ADD a printer, we need to manually start CUPS and not rely on socket
# activation alone. Notice here we are only starting the service. We are NOT enabling
# it, so it won't automatically start after reboot.

UNIT="cups.service"

depends_on cups-installed

satisfied_if() {
  test "$(systemctl is-active "${UNIT}")" == "active"
}

apply() {
  as_root systemctl start "${UNIT}"
}
