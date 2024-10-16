#!/usr/bin/env blarg

depends_on rofi/main  # qtile launches rofi in config

REPO_PATH="${BLARG_CWD}/config/qtile/config.py"
SYSTEM_PATH=~/.config/qtile/config.py

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -f "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
