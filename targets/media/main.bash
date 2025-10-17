#!/usr/bin/env blarg

targets=(
  vlc-installed
  vlc-supporting-packages-installed
  newsboat-installed
  newsboat-configured
  inkscape-installed
)

depends_on "${targets[@]}"
