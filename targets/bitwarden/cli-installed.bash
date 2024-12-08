#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="bw-cli"

satisfied_if() {
    command -v bw
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
