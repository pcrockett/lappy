#!/usr/bin/env blarg

PACKAGES=(
    TODO
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
