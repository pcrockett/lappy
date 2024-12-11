#!/usr/bin/env blarg

depends_on core/main core/with-umask-installed  # for jq

REPO_CONFIG_DIR="${BLARG_CWD}/config/aerc"
SYSTEM_CONFIG_DIR="${HOME}/.config/aerc"

satisfied_if() {
    test -f "${REPO_CONFIG_DIR}/accounts.conf"
    test_symlink "${REPO_CONFIG_DIR}" "${SYSTEM_CONFIG_DIR}"
}

apply() {
    satisfy bitwarden/unlocked
    CONFIG_JSON="$(bw get item beekrpad.aerc.personal)"

    PERSONAL_EMAIL_ACCT_NAME="$(get_value account-name)" \
        PERSONAL_EMAIL_IMAP="$(get_value imap)" \
        PERSONAL_EMAIL_SMTP="$(get_value smtp)" \
        PERSONAL_EMAIL_USER_FULL_NAME="$(get_value user-full-name)" \
        PERSONAL_EMAIL_ADDRESS="$(get_value address)" \
        envsubst < "${REPO_CONFIG_DIR}/accounts.conf.tmpl" \
        | with-umask u=rw,g=,o= dd "of=${REPO_CONFIG_DIR}/accounts.conf" status=none

    rm -rf "${SYSTEM_CONFIG_DIR}"
    ln --symbolic "${REPO_CONFIG_DIR}" "${SYSTEM_CONFIG_DIR}"
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
