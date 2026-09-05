#!/usr/bin/env blarg

REPO_PATH="${BLARG_MODULE_DIR}/config/hister/hister.service"
SYSTEM_PATH=~/.config/systemd/user/hister.service

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}"
}

apply() {
  mkdir -p "$(dirname "${SYSTEM_PATH}")"
  rm -f "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
  systemctl --user daemon-reload
}
