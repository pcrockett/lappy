#!/usr/bin/env blarg

PACKAGES=(
    signal-desktop
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    install_package "${PACKAGES[@]}"
}
