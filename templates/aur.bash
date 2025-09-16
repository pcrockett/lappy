#!/usr/bin/env blarg

depends_on aur/main

PACKAGES=(
    TODO
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    yay -Syu --aur --noconfirm "${PACKAGES[@]}"
}
