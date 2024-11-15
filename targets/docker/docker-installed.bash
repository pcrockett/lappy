#!/usr/bin/env blarg

PACKAGES=(
    docker
    docker-compose
    docker-buildx
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy ../network/main
    install_package "${PACKAGES[@]}"
}
