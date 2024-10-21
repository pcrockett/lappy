#!/usr/bin/env blarg

PACKAGES=(
    wikiman
    arch-wiki-docs
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
