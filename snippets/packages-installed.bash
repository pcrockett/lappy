# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    "${BLARG_CWD}/targets/network/main.bash"
    install_package "${PACKAGES[@]}"
}

