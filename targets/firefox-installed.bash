#!/usr/bin/env blarg

reached_if() {
    package_is_installed firefox
}

apply() {
    apply_target network/main
    install_package firefox
}
