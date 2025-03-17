#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="simplex-tui"

satisfied_if() {
    command -v simplex-chat
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
