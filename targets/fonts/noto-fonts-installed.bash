#!/usr/bin/env blarg

PACKAGES=(
    noto-fonts
    noto-fonts-emoji
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
    fc-cache --force
}
