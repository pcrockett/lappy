#!/usr/bin/env blarg

depends_on ../rush/main ../core/main

PACKAGE_NAME="kbgrep"

reached_if() {
    command -v kbg
}

apply() {
    satisfy ../rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
