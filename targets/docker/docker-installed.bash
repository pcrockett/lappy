#!/usr/bin/env blarg

PACKAGES=(
    docker
    docker-compose
    docker-buildx
)

reached_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    install_package "${PACKAGES[@]}"
}
