#!/usr/bin/env blarg

PACKAGES=(
    fx
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    apply_target ../network/main
    install_package "${PACKAGES[@]}"
}
