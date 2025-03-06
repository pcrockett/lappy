#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/newsboat"
SYSTEM_PATH=~/.newsboat

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
