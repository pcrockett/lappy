#!/usr/bin/env blarg

reached_if() {
    package_is_installed firefox
}

apply() {
    install_package firefox
}
