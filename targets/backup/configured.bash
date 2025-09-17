#!/usr/bin/env blarg

depends_on \
  restic-installed \
  core/jq-installed \
  core/with-umask-installed

REPO_CONFIG_DIR="${BLARG_CWD}/config/backup"

satisfied_if() {
  test -d /etc/backup
}

apply() {
  satisfy bitwarden/synced
  as_root with-umask u=rwx,g=,o= mkdir --parent /etc/backup.tmp
  CONFIG_JSON="$(bw get item beekrpad.backblaze.backup)"

  # shellcheck disable=SC2016  # not trying to expand dollar signs in single quotes
  RESTIC_E2EE_PASSWORD="$(get_value restic.encryption-key)" \
  AWS_ACCESS_KEY_ID="$(get_value key.id)" \
  AWS_SECRET_ACCESS_KEY="$(get_value key.secret)" \
  BUCKET_URL="$(get_value bucket.url)" \
  HOSTNAME="$(hostnamectl hostname)" \
  HOME="${HOME}" \
    envsubst '$RESTIC_E2EE_PASSWORD $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY $BUCKET_URL $HOSTNAME $HOME' <"${REPO_CONFIG_DIR}/config.sh.template" \
    | as_root with-umask u=rw,g=,o= dd of=/etc/backup.tmp/config.sh status=none
  as_root mv /etc/backup.tmp /etc/backup
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
