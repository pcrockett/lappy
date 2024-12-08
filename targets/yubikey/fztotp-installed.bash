#!/usr/bin/env blarg

depends_on rush/main cli/main  # cli/main for `xsel`

PACKAGE_NAME="fztotp"

satisfied_if() {
    command -v fztotp
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
