#!/usr/bin/env blarg

depends_on core/with-umask-installed

FILE_NAME="config"
REPO_CONFIG_DIR="${BLARG_CWD}/config/vdirsyncer"
SYSTEM_CONFIG_DIR="${HOME}/.config/vdirsyncer"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template" \
    && files_are_same "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
}

apply() {
  template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
  with-umask u=rwx,g=,o= mkdir --parent "${SYSTEM_CONFIG_DIR}"
  with-umask u=rw,g=,o= cp "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}"
}
