#!/usr/bin/env blarg

depends_on rush/main core/ripgrep-installed core/bat-installed core/fzf-installed

PACKAGE_NAME="kbgrep"

satisfied_if() {
  command -v kbg
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
