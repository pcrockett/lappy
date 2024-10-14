#!/usr/bin/env blarg

reached_if() {
    package_is_installed fish
}

apply() {
    install_package fish
}
