#!/usr/bin/env blarg

PACKAGES=(
    bluez
    bluez-utils
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
