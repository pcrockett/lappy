#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed direnv
}

apply() {
    satisfy ../network/main
    install_package direnv
}
