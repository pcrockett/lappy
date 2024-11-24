#!/usr/bin/env blarg

depends_on ../rush/main ../core/fzf-installed

PACKAGE_NAME="fzd"

satisfied_if() {
    command -v fzd
}

apply() {
    satisfy ../rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
