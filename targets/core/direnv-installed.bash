#!/usr/bin/env blarg

reached_if() {
    package_is_installed direnv
}

apply() {
    satisfy ../network/main
    install_package direnv
}
