#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/mise"
SYSTEM_PATH=~/.config/mise

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  rm -rf "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
