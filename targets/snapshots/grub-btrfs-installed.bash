#!/usr/bin/env blarg

depends_on inotify-tools-installed

PACKAGES=(
  grub-btrfs
)

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy network/main
  satisfy core/arch-news-checked
  install_package "${PACKAGES[@]}"
}
