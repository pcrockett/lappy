#!/usr/bin/env blarg

depends_on fonts/main

REPO_PATH="${BLARG_CWD}/config/alacritty"
SYSTEM_PATH=~/.config/alacritty

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
