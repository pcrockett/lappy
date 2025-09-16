#!/usr/bin/env blarg

SOURCE_FILE="${BLARG_CWD}/config/sleep/00_sleep_hook.sh"
SLEEP_HOOK_PATH="/usr/lib/systemd/system-sleep/00_sleep_hook.sh"

satisfied_if() {
  files_are_same "${SOURCE_FILE}" "${SLEEP_HOOK_PATH}"
}

apply() {
  as_root install --no-target-directory \
    "${SOURCE_FILE}" \
    "${SLEEP_HOOK_PATH}"
}
