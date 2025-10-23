#!/usr/bin/env blarg

REPO_CONFIG_DIR="${BLARG_CWD}/config/root"
CHECKSUM_FILE="${REPO_CONFIG_DIR}/sha1sums"

satisfied_if() {
  test -f "${CHECKSUM_FILE}" && sha1sum --check "${CHECKSUM_FILE}"
}

apply() {
  as_root dd of=/root/.bashrc status=none <"${REPO_CONFIG_DIR}/bashrc"
  as_root dd of=/root/.bash_profile status=none <"${REPO_CONFIG_DIR}/bash_profile"
  sha1sum "${REPO_CONFIG_DIR}/bashrc" "${REPO_CONFIG_DIR}/bash_profile" >"${CHECKSUM_FILE}"
}
