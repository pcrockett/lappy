# Define the following before running this snippet:
#
# * PACKAGE: the fully-qualified name of the flatpak you want to install
#

depends_on core/flatpak-installed

satisfied_if() {
  flatpak info "${PACKAGE}"
}

apply() {
  flatpak install --assumeyes --noninteractive "${PACKAGE}"
}
