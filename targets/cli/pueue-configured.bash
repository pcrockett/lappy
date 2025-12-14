#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/pueue/pueued.service"
SYSTEM_PATH=~/.config/systemd/user/pueued.service

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  rm -f "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
  systemctl --user daemon-reload
}
