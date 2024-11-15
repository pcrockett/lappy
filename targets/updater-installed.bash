#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="updater"

reached_if() {
    command -v software-update
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
