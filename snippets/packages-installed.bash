# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

depends_on network/main

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy arch-news-checked
    satisfy snapshots/created
    install_package "${PACKAGES[@]}"
}

