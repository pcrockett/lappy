# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

depends_on network/main
before_apply arch-news-checked

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
#    satisfy snapshots/created
    install_package "${PACKAGES[@]}"
}

