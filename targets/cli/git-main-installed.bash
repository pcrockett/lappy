#!/usr/bin/env blarg

depends_on ../rush/main

PACKAGE_NAME="git-main"

reached_if() {
    command -v git-main
}

apply() {
    depends_on ../rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
