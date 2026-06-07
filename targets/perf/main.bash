#!/usr/bin/env blarg

targets=(
  cpupower-installed
  tlp-started
)

depends_on "${targets[@]}"
