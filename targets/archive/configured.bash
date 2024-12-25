#!/usr/bin/env blarg

depends_on \
    rush/main \
    rclone-installed \
    core/jq-installed \
    core/fuse3-installed

satisfied_if() {
    test -d ~/Cloud
}

apply() {
    satisfy rush/rush-repo-pulled bitwarden/synced

    CONFIG_JSON="$(bw get item beekrpad.backblaze.archive)"
    ARCHIVE_BUCKET_NAME="$(get_value bucket)" \
        ARCHIVE_APPLICATION_KEY_ID="$(get_value key.id)" \
        ARCHIVE_APPLICATION_KEY_SECRET="$(get_value key.secret)" \
        ARCHIVE_ENCRYPTION_KEY="$(get_value rclone.encryption-key)" \
        rush get rclone-archive --force
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
