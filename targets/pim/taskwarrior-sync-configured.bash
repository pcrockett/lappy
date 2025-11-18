#!/usr/bin/env blarg

depends_on core/jq-installed core/with-umask-installed bitwarden/cli-installed

FILE_NAME="twsync.conf"
REPO_CONFIG_DIR="${BLARG_CWD}/config/taskwarrior"

satisfied_if() {
  template_was_rendered "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
}

apply() {
  satisfy bitwarden/synced
  load_bw_item beekrpad.taskwarrior

  TASKWARRIOR_SYNC_ENCRYPTION_SECRET="$(bw_value encryption-secret)" \
  TASKWARRIOR_SYNC_URL="$(bw_value sync-url)" \
  TASKWARRIOR_SYNC_CLIENT_ID="$(bw_value client-id)" \
    template_render "${REPO_CONFIG_DIR}/${FILE_NAME}.template"
}
