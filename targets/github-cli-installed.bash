#!/usr/bin/env blarg

reached_if() {
    package_is_installed github-cli
}

apply() {
    install_package github-cli
}
