#!/usr/bin/env blarg

depends_on ../rush/main ../core/main

PACKAGE_NAME="pubip"

reached_if() {
    command -v "${PACKAGE_NAME}"
}

apply() {
    depends_on ../rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
