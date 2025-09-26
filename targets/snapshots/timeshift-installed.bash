#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
  timeshift
)

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy network/main
  satisfy core/arch-news-checked
  install_package "${PACKAGES[@]}"
}
