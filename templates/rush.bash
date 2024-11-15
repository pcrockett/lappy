#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="TODO"
panic "not implemented yet"

satisfied_if() {
    false # command -v some-bin
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
