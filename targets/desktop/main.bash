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
)

depends_on "${targets[@]}"
