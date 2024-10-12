# shellcheck shell=bash

install_package() {
    sudo pacman -Syu --noconfirm "${@}"
}

remove_package() {
    sudo pacman -R --noconfirm "${@}"
}

package_is_installed() {
    pacman --query "${@}"
}
