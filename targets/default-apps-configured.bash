#!/usr/bin/env blarg

depends_on web/librewolf-installed

REPO_PATH="${BLARG_CWD}/config/default-apps/mimeapps.list"
SYSTEM_PATH=~/.config/mimeapps.list

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
    rm -f "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
