#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed git
}

apply() {
    satisfy ../network/main
    install_package git
}
