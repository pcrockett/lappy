#!/usr/bin/env blarg

PACKAGES=(
    TODO
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    install_package "${PACKAGES[@]}"
}
