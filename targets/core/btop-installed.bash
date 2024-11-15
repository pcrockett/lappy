#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed btop
}

apply() {
    satisfy ../network/main
    install_package btop
}
