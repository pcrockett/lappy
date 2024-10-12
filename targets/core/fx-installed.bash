#!/usr/bin/env blarg

PACKAGES=(
    fx
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
