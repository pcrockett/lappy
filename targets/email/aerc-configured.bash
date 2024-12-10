#!/usr/bin/env blarg

depends_on core/main  # for jq

satisfied_if() {
    false
}

apply() {
    satisfy bitwarden/unlocked
    CONFIG_JSON="$(bw get item beekrpad.aerc.personal)"
    PERSONAL_EMAIL_ACCT_NAME="$(get_value account-name)" \
        PERSONAL_EMAIL_IMAP="$(get_value imap)" \
        PERSONAL_EMAIL_SMTP="$(get_value smtp)" \
        PERSONAL_EMAIL_USER_FULL_NAME="$(get_value user-full-name)" \
        PERSONAL_EMAIL_ADDRESS="$(get_value address)" \
        envsubst \
        < "${BLARG_CWD}/config/aerc/accounts.conf.tmpl"
    panic "not implemented yet"
}

get_value() {
    key="${1}"
    echo "${CONFIG_JSON}" | jq --raw-output "
    .fields | map(
        select(
            .name == \"${key}\"
        )
    )[].value"
}
