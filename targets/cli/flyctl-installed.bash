#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="flyctl"

satisfied_if() {
    command -v flyctl
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
