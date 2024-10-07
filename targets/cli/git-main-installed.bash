#!/usr/bin/env blarg

depends_on ../rush/main

PACKAGE_NAME="git-main"

reached_if() {
    command -v git-main
}

apply() {
    rush get "${PACKAGE_NAME}"
}
