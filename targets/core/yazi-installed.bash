#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed yazi
}

apply() {
    satisfy ../network/main
    install_package yazi
}
