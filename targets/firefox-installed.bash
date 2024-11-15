#!/usr/bin/env blarg

reached_if() {
    package_is_installed firefox
}

apply() {
    satisfy network/main
    install_package firefox
}
