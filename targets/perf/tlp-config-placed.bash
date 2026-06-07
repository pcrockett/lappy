#!/usr/bin/env blarg

depends_on core/with-umask-installed

FILE_NAME="charge-thresholds.conf"
REPO_CONFIG_DIR="${BLARG_CWD}/config/tlp"
SYSTEM_CONFIG_DIR="/etc/tlp.d"

satisfied_if() {
  files_are_same "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
}

apply() {
  as_root with-umask u=rwx,g=rx,o=rx mkdir --parent "${SYSTEM_CONFIG_DIR}"
  as_root with-umask u=rw,g=r,o=r cp "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}"
}
