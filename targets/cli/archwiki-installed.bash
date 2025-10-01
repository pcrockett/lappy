#!/usr/bin/env blarg

depends_on \
  arch-wiki-docs-installed \
  rush/main \
  core/w3m-installed \
  core/ripgrep-installed \
  core/fzf-installed

PACKAGE_NAME="archwiki"

satisfied_if() {
  command -v archwiki
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
