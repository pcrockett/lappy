#!/usr/bin/env blarg

targets=(
  qtile-configured
  pactl-volume-installed
  rofi-installed
  rofi-configured
  default-apps-configured
  flameshot-installed
  html-mime-type-configured
  nautilus-installed
  keyboard-locale-configured
  keyd-started
  qtile-launch-fixed
)

depends_on "${targets[@]}"
