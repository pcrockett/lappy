#!/usr/bin/env blarg

depends_on ../rush/main ../core/fzf-installed ../core/man-db-enabled

PACKAGE_NAME="fzman"

reached_if() {
    command -v fzman
}

apply() {
    satisfy ../rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
