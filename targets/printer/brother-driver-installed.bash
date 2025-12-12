#!/usr/bin/env blarg

PACKAGES=(
  brlaser
)

depends_on aur/main

satisfied_if() {
  package_is_installed "${PACKAGES[@]}"
}

apply() {
  satisfy network/main
  yay -Syu --aur --noconfirm "${PACKAGES[@]}"
  if [ "$(systemctl is-active cups.service)" == "active" ]; then
    as_root systemctl restart cups.service
  fi
}
