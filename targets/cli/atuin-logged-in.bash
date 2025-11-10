#!/usr/bin/env blarg

depends_on atuin-installed core/jq-installed bitwarden/cli-installed

satisfied_if() {
  atuin status
}

apply() {
  satisfy bitwarden/synced
  load_bw_item atuin
  atuin login \
    --username "$(bw_username)" \
    --password "$(bw_password)" \
    --key "$(bw_value encryption-key)"
}
