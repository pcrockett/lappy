#!/usr/bin/env blarg

# this package causes braille characters to not show up properly
# replacing it with noto-fonts seems to solve the problem

depends_on noto-fonts-installed

PACKAGES=(
    gnu-free-fonts
)

satisfied_if() {
    ! package_is_installed "${PACKAGES[@]}"
}

apply() {
    remove_package "${PACKAGES[@]}"
}
