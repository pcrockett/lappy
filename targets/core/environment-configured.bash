#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/environment/profile"
SYSTEM_PATH=~/.profile

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
  echo "Environment configured! Log out and back in to continue."
  exit 1
}
