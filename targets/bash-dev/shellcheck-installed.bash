#!/usr/bin/env blarg

PACKAGE_NAME="shellcheck"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    satisfy ../network/main
    install_package "${PACKAGE_NAME}"
}
