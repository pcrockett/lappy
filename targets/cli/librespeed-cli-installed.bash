#!/usr/bin/env blarg

depends_on ../aur/main

PACKAGES=(
    librespeed-cli-bin
)

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    "${BLARG_CWD}/targets/network/main.bash"
    yay -Syu --aur --noconfirm "${PACKAGES[@]}"
}
