#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed helix
}

apply() {
    satisfy ../network/main
    install_package helix
}
