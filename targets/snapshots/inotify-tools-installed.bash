#!/usr/bin/env blarg

PACKAGES=(
  inotify-tools
)

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy network/main
  satisfy core/arch-news-checked
  install_package "${PACKAGES[@]}"
}
