#!/usr/bin/env blarg

depends_on taskwarrior-sync-configured

REPO_PATH="${BLARG_CWD}/config/taskwarrior"
SYSTEM_PATH=~/.config/task

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  rm -rf "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
