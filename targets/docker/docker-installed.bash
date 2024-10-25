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
    apply_target ../network/main
    install_package "${PACKAGES[@]}"
}
