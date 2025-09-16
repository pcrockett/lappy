#!/usr/bin/env blarg

REPO_PATH="${BLARG_CWD}/config/gurk"
SYSTEM_PATH=~/.config/gurk

satisfied_if() {
  test_symlink "${REPO_PATH}" "${SYSTEM_PATH}" &&
    test -f "${SYSTEM_PATH}/gurk.toml" &&
    template_was_rendered "${REPO_PATH}/gurk.toml.template"
}

apply() {
  SIGNAL_PHONE_NUMBER="${SIGNAL_PHONE_NUMBER}" \
    HOME="${HOME}" \
    template_render "${REPO_PATH}/gurk.toml.template"
  rm -rf "${SYSTEM_PATH}"
  ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
}
