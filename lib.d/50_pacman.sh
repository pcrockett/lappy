# shellcheck shell=bash

install_package() {
  as_root pacman -Syu --needed --noconfirm "${@}"
}

remove_package() {
  as_root pacman -R --noconfirm "${@}"
}

package_is_installed() {
  pacman --query "${@}"
}
