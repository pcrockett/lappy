#!/usr/bin/env blarg

reached_if() {
    package_is_installed fish
}

apply() {
    satisfy ../../network/main
    install_package fish
}
