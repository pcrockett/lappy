#!/usr/bin/env blarg

PACKAGES=(
    noto-fonts
    noto-fonts-emoji
    ttf-hack-nerd
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy ../network/main
    install_package "${PACKAGES[@]}"
    fc-cache --force
}
