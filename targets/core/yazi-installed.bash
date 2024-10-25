#!/usr/bin/env blarg

reached_if() {
    package_is_installed yazi
}

apply() {
    apply_target ../network/main
    install_package yazi
}
