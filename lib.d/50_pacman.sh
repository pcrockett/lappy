# shellcheck shell=bash

install_package() {
    sudo pacman -Syu --noconfirm "${@}"
}

package_is_installed() {
    pacman --query "${@}"
}
