#!/usr/bin/env blarg

PACKAGE_NAME="mypy"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    install_package "${PACKAGE_NAME}"
}
