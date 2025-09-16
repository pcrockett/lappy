#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
  btop
  fx
  pacman-contrib # rankmirrors and pacdiff
  unzip
  ueberzugpp # image previews in terminal / yazi
  yazi
  zip
)

snippet "packages-installed"
