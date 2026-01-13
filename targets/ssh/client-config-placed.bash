#!/usr/bin/env blarg

depends_on core/with-umask-installed tailscale/tailscale-up

FILE_NAME="config"
REPO_CONFIG_DIR="${BLARG_CWD}/config/ssh"
SYSTEM_CONFIG_DIR="${HOME}/.ssh"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template" \
    && test_symlink "${REPO_CONFIG_DIR}/config" "${SYSTEM_CONFIG_DIR}/config"
}

apply() {
  HOMELAB_VMHOST_IP="$(tailscale ip --4 "${HOMELAB_VMHOST_HOSTNAME}")"
  export HOMELAB_VMHOST_IP
  template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
  with-umask u=rwx,g=,o= mkdir --parent "${SYSTEM_CONFIG_DIR}"
  rm -f "${SYSTEM_CONFIG_DIR}/config"
  ln --symbolic "${REPO_CONFIG_DIR}/config" "${SYSTEM_CONFIG_DIR}/config"
}
