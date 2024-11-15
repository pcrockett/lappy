#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed github-cli
}

apply() {
    satisfy network/main
    install_package github-cli
}
