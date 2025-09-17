# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

depends_on aur/main

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy network/main
  yay -Syu --aur --noconfirm "${PACKAGES[@]}"
}
