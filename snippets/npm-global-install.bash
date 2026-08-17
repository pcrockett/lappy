# define the following before rendering this snippet:
#
# * PACKAGES: bash array of package names
#
# IMPORTANT: this assumes the package name is the same as the executable name

depends_on helix/pnpm-installed core/environment-configured

satisfied_if() {
  for p in "${PACKAGES[@]}"; do
    command -v "${p}" || return 1
  done
}

apply() {
  test "${PNPM_HOME:-}" != "" || panic "PNPM_HOME not set yet. Do you need to log out and back in?"
  pnpm install --global "${PACKAGES[@]}"
}
