#!/usr/bin/env blarg

depends_on rush/main restic-installed

PACKAGE_NAME="backup-cli"

satisfied_if() {
  command -v backup && test -x /usr/local/bin/backup
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
