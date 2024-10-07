#!/usr/bin/env blarg

depends_on gnome-keyring-enabled

PACKAGE_NAME="seahorse"

reached_if() {
    package_is_installed "${PACKAGE_NAME}"
}

apply() {
    install_package "${PACKAGE_NAME}"
}
