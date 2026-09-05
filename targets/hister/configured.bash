#!/usr/bin/env blarg

depends_on core/with-umask-installed

FILE_NAME="config.yml"
REPO_CONFIG_DIR="${BLARG_CWD}/config/hister"
SYSTEM_CONFIG_DIR="${HOME}/.config/hister"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template" \
    && files_are_same "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}" \
    && files_are_same "${REPO_CONFIG_DIR}/tui.yaml" "${SYSTEM_CONFIG_DIR}/tui.yaml"
}

apply() {
  test "${HISTER_ACCESS_TOKEN:-}" != "" \
    || panic "Must specify HISTER_ACCESS_TOKEN env variable."

  template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
  mkdir --mode u=rwx,g=rx,o=rx --parent "${SYSTEM_CONFIG_DIR}"
  mkdir --mode u=rwx,g=,o= --parent "${HOME}/.local/share/hister"
  install --mode u=rw,g=,o= "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
  install --mode u=rw,g=r,o=r "${REPO_CONFIG_DIR}/tui.yaml" "${SYSTEM_CONFIG_DIR}/tui.yaml"
}
