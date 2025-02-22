#!/usr/bin/env blarg

PACKAGES=(
    noto-fonts
    noto-fonts-emoji
    ttf-font-awesome
    ttf-hack-nerd
    ttf-nerd-fonts-symbols
    ttf-nerd-fonts-symbols-common
    ttf-nerd-fonts-symbols-mono
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    install_package "${PACKAGES[@]}"
    fc-cache --force
}
