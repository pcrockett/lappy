#!/usr/bin/env blarg

depends_on rush/main cli/nushell-installed git/git-installed github-cli-installed

PACKAGE_NAME="git-pr"

satisfied_if() {
  command -v "${PACKAGE_NAME}"
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
