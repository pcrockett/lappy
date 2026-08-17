#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/fish"
SYSTEM_PATH=~/.config/fish

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  rm -rf "${SYSTEM_PATH}"
  mkdir --parent "$(dirname "${SYSTEM_PATH}")"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
