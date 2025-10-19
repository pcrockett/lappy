#!/usr/bin/env blarg

depends_on core/jq-installed core/with-umask-installed bitwarden/cli-installed

FILE_NAME="config"
REPO_CONFIG_DIR="${BLARG_CWD}/config/vdirsyncer"
SYSTEM_CONFIG_DIR="${HOME}/.config/vdirsyncer"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template" \
    && files_are_same "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}/${FILE_NAME}"
}

apply() {
  satisfy bitwarden/synced
  load_bw_item beekrpad.vdirsyncer

  FASTMAIL_USER_ACCT="$(bw_value fastmail-user)" \
  FASTMAIL_CALDAV_PASSWORD="$(bw_value caldav-password)" \
  CALENDARS_TO_SYNC="$(bw_value calendars)" \
    template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
  with-umask u=rwx,g=,o= mkdir --parent "${SYSTEM_CONFIG_DIR}" "${HOME}/.local/share/lappy-pim/calendar"
  with-umask u=rw,g=,o= cp "${REPO_CONFIG_DIR}/${FILE_NAME}" "${SYSTEM_CONFIG_DIR}"
}
