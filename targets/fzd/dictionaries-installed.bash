#!/usr/bin/env blarg

depends_on aur/main

PACKAGES=(
    dict-freedict-eng-deu-bin
    dict-freedict-deu-eng-bin
    dict-wn
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main
    yay -Syu --aur --noconfirm "${PACKAGES[@]}"
}
