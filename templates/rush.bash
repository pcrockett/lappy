#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="TODO"
panic "not implemented yet"

reached_if() {
    false # command -v some-bin
}

apply() {
    apply_target rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
