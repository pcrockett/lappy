#!/usr/bin/env blarg

depends_on cups-installed

satisfied_if() {
  test "$(systemctl is-enabled cups.socket)" == "enabled"
}

apply() {
  as_root systemctl enable cups.socket
}
