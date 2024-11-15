#!/usr/bin/env blarg

reached_if() {
    package_is_installed btop
}

apply() {
    satisfy ../network/main
    install_package btop
}
