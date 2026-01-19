#!/usr/bin/env blarg

depends_on with-umask-installed

SOURCE_CONFIG="${BLARG_CWD}/config/sudo/50_custom"
DEST_CONFIG="/etc/sudoers.d/50_custom"

satisfied_if() {
  # The /etc/sudoers.d directory is readable only by root. This means it'll be very
  # annoying to even run `is_satisfied`, as it would need to run `sudo` and require a
  # password. Gross. So we'll use the checkpoint system instead.
  checkpoint_is_current "${SOURCE_CONFIG}"
}

apply() {
  visudo --check --strict --file "${SOURCE_CONFIG}"
  as_root with-umask u=r,g=r,o= cp "${SOURCE_CONFIG}" "${DEST_CONFIG}"
  as_root visudo --check --strict
  checkpoint_success
}
