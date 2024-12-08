#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="srch"

satisfied_if() {
    command -v srch
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
