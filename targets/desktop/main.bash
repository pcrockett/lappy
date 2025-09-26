#!/usr/bin/env blarg

targets=(
  qtile-configured
  pactl-volume-installed
  rofi-installed
  rofi-configured
  default-apps-configured
)

depends_on "${targets[@]}"
