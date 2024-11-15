#!/usr/bin/env blarg

PACKAGES=(
    yubikey-manager
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy ../network/main
    install_package "${PACKAGES[@]}"
}
