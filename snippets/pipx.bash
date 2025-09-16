# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#

depends_on python/pipx-installed

satisfied_if() {
  for package in "${PACKAGES[@]}"; do
    pipx list --short | grep --fixed-strings --word-regexp "${package}" ||
      return 1
  done
}

apply() {
  pipx install "${PACKAGES[@]}"
}
