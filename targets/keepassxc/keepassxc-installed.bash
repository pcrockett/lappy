#!/usr/bin/env blarg

PACKAGE_NAME="keepassxc"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    install_package "${PACKAGE_NAME}"
}
