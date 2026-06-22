#!/usr/bin/env blarg

targets=(
  cpupower-installed
  tlp-started
  knobs-installed
  knobs-configured
)

depends_on "${targets[@]}"
