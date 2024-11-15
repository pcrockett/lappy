#!/usr/bin/env blarg

PACKAGE_NAME="fzf"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    satisfy ../network/main
    install_package "${PACKAGE_NAME}"
}
