#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed firefox
}

apply() {
    satisfy network/main
    install_package firefox
}
