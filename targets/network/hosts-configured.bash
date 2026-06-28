#!/usr/bin/env blarg

depends_on core/with-umask-installed

FILE_NAME="hosts"
REPO_CONFIG_DIR="${BLARG_CWD}/config/network"
SYSTEM_CONFIG_DIR="/etc"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template" \
    && files_are_same "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
}

apply() {
  template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
  as_root install --mode u=rw,g=r,o=r "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
}
