# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

depends_on network/main

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy core/arch-news-checked
  install_package "${PACKAGES[@]}"
}
