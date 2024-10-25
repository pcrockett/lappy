#!/usr/bin/env blarg

PACKAGES=(
    noto-fonts
    noto-fonts-emoji
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    apply_target ../network/main
    install_package "${PACKAGES[@]}"
    fc-cache --force
}
