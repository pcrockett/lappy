#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed fish
}

apply() {
    satisfy ../../network/main
    install_package fish
}
