#!/usr/bin/env blarg

PACKAGES=(
    inotify-tools
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    install_package "${PACKAGES[@]}"
}
