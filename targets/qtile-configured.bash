#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/qtile/config.py"
SYSTEM_PATH=~/.config/qtile/config.py

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -f "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
