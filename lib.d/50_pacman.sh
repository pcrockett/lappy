# shellcheck shell=bash

install_package() {
    sudo pacman -Syu --noconfirm "${@}"
}
