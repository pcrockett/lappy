#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="updater"

reached_if() {
    command -v software-update
}

apply() {
    apply_target rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
