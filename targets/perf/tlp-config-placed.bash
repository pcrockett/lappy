#!/usr/bin/env blarg

depends_on core/with-umask-installed

FILE_NAMES=(
  charge-thresholds.conf
  disk.conf
  intel-me.conf
)
REPO_CONFIG_DIR="${BLARG_CWD}/config/tlp"
SYSTEM_CONFIG_DIR="/etc/tlp.d"

satisfied_if() {
  for file in "${FILE_NAMES[@]}"; do
    files_are_same "${REPO_CONFIG_DIR}/${file}" "${SYSTEM_CONFIG_DIR}/${file}"
  done
}

apply() {
  as_root with-umask u=rwx,g=rx,o=rx mkdir --parent "${SYSTEM_CONFIG_DIR}"
  for file in "${FILE_NAMES[@]}"; do
    as_root install --mode u=rw,g=r,o=r "${REPO_CONFIG_DIR}/${file}" "${SYSTEM_CONFIG_DIR}/${file}"
  done

  if [ "$(systemctl is-active tlp.service)" == "active" ]; then
    as_root systemctl restart tlp.service
  fi
}
