#!/usr/bin/env blarg

PACKAGES=(
    rofi
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
