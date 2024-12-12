#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/fish"
SYSTEM_PATH=~/.config/fish

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"

    echo "Success! Restart your shell before continuing."
    exit 1
}
