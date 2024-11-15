#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="tagref"

reached_if() {
    command -v tagref
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
