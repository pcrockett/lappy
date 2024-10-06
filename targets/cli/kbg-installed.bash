#!/usr/bin/env blarg

depends_on ../rush/main ../core/main

PACKAGE_NAME="kbgrep"

reached_if() {
    command -v kbg
}

apply() {
    rush get "${PACKAGE_NAME}"
}
