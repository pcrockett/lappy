#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/asdf/tool-versions"
SYSTEM_PATH=~/.tool-versions

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
