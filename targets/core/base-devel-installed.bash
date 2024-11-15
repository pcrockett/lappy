#!/usr/bin/env blarg

PACKAGES=(
    base-devel
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    install_package "${PACKAGES[@]}"
}
