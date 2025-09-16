#!/usr/bin/env blarg

targets=(
  font-packages-installed
  gnu-free-fonts-removed
  fontconfig-placed
)

depends_on "${targets[@]}"
