#!/usr/bin/env blarg

PACKAGES=(
    ttf-hack-nerd
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    apply_target ../network/main
    install_package "${PACKAGES[@]}"
    fc-cache --force
}
