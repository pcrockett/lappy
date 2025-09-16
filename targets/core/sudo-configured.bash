#!/usr/bin/env blarg

# Unfortunately, the /etc/sudoers.d directory is readable only by root. This means
# it'll be very annoying to even run `is_satisfied`, as it would need to run `sudo` and
# require a password. Gross. So instead we will use a marker file to see if `sudo` needs
# to be configured or not.

depends_on with-umask-installed

STATE_DIR="${HOME}/.local/state/lappy"
MARKER_FILE="${STATE_DIR}/sudo-configured"
SOURCE_CONFIG="${BLARG_CWD}/config/sudo/50_custom"
DEST_CONFIG="/etc/sudoers.d/50_custom"

satisfied_if() {
    test -f "${MARKER_FILE}" &&
        test "$(file_timestamp "${SOURCE_CONFIG}")" -lt "$(file_timestamp "${MARKER_FILE}")"
}

apply() {
    visudo --check --strict --file "${SOURCE_CONFIG}"
    mkdir --parent "${STATE_DIR}"
    as_root with-umask u=r,g=r,o= cp "${SOURCE_CONFIG}" "${DEST_CONFIG}"
    as_root visudo --check --strict
    touch "${MARKER_FILE}"
}
