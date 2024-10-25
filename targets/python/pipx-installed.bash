#!/usr/bin/env blarg

PACKAGE_NAME="python-pipx"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    apply_target ../network/main
    install_package "${PACKAGE_NAME}"
}
