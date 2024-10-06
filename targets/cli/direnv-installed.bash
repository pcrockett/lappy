#!/usr/bin/env blarg

reached_if() {
    package_is_installed direnv
}

apply() {
    install_package direnv
}
