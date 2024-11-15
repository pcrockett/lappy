#!/usr/bin/env blarg

reached_if() {
    package_is_installed yazi
}

apply() {
    satisfy ../network/main
    install_package yazi
}
