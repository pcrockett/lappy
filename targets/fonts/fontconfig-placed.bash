#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/fonts/fonts.conf"
SYSTEM_PATH=~/.config/fontconfig/fonts.conf

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    mkdir --parent "$(dirname "${SYSTEM_PATH}")"
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
