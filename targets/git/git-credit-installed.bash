#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="git-credit"

satisfied_if() {
    command -v "${PACKAGE_NAME}"
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
