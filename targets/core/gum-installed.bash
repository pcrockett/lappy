#!/usr/bin/env blarg

PACKAGES=(
    gum
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
