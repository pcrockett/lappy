#!/usr/bin/env blarg

targets=(
  vlc-installed
  newsboat-installed
  newsboat-configured
  inkscape-installed
)

depends_on "${targets[@]}"
