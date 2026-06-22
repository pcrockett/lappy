#!/usr/bin/env blarg

depends_on rush/main core/fzf-installed core/bat-installed cli/nushell-installed

PACKAGE_NAME="knobs"

satisfied_if() {
  command -v "${PACKAGE_NAME}"
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
