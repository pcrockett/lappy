#!/usr/bin/env blarg

REPO_PATH="${CONFIG_DIR}/gh-dash"
SYSTEM_PATH=~/.config/gh-dash

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  rm -rf "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
