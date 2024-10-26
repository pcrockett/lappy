#!/usr/bin/env blarg

depends_on rush/main

REPO_PATH="${BLARG_CWD}/bin/software-update"
SYSTEM_PATH=~/.local/bin/software-update

reached_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
