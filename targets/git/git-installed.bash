#!/usr/bin/env blarg

reached_if() {
    package_is_installed git
}

apply() {
    install_package git
}
