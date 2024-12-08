#!/usr/bin/env blarg

depends_on rush/main core/main

PACKAGE_NAME="yay"

satisfied_if() {
    command -v yay
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
