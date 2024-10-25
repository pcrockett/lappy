#!/usr/bin/env blarg

reached_if() {
    package_is_installed github-cli
}

apply() {
    apply_target network/main
    install_package github-cli
}
