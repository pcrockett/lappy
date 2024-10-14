#!/usr/bin/env blarg

reached_if() {
    package_is_installed helix
}

apply() {
    install_package helix
}
