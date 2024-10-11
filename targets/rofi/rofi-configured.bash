#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/rofi"
SYSTEM_PATH=~/.config/rofi

depends_on rofi-theme-placed

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
