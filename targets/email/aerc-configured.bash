#!/usr/bin/env blarg

depends_on core/jq-installed core/with-umask-installed bitwarden/cli-installed

REPO_CONFIG_DIR="${BLARG_CWD}/config/aerc"
SYSTEM_CONFIG_DIR="${HOME}/.config/aerc"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/accounts.conf.template" \
    && test_symlink "${REPO_CONFIG_DIR}" "${SYSTEM_CONFIG_DIR}"
}

apply() {
  satisfy bitwarden/synced
  load_bw_item beekrpad.aerc.personal

  PERSONAL_EMAIL_ACCT_NAME="$(bw_value account-name)" \
  PERSONAL_EMAIL_IMAP="$(bw_value imap)" \
  PERSONAL_EMAIL_SMTP="$(bw_value smtp)" \
  PERSONAL_EMAIL_USER_FULL_NAME="$(bw_value user-full-name)" \
  PERSONAL_EMAIL_ADDRESS="$(bw_value address)" \
  PERSONAL_EMAIL_DOMAIN="$(bw_value domain)" \
    template_render "${REPO_CONFIG_DIR}/accounts.conf.template"

  rm -rf "${SYSTEM_CONFIG_DIR}"
  ln --symbolic "${REPO_CONFIG_DIR}" "${SYSTEM_CONFIG_DIR}"
}
