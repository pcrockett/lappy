#!/usr/bin/env blarg

reached_if() {
    package_is_installed helix
}

apply() {
    apply_target ../network/main
    install_package helix
}
