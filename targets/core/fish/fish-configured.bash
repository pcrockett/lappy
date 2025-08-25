#!/usr/bin/env blarg

depends_on core/environment-configured

REPO_PATH="${BLARG_CWD}/config/fish"
SYSTEM_PATH=~/.config/fish

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
