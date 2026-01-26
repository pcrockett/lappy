#!/usr/bin/env blarg

depends_on rush/main cli/nushell-installed taskwarrior-installed

PACKAGE_NAME="tw"

satisfied_if() {
  command -v "${PACKAGE_NAME}"
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
