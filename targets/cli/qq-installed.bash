#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="qq"

satisfied_if() {
    command -v qq
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
