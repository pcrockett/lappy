#!/usr/bin/env blarg

depends_on rush/main core/fzf-installed

PACKAGE_NAME="fzmake"

satisfied_if() {
  command -v fzmake
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
