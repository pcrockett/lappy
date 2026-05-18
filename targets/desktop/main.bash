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
)

depends_on "${targets[@]}"
