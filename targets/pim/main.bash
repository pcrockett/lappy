#!/usr/bin/env blarg

# wip
targets=(
  vdirsyncer-installed
  khal-installed
  vdirsyncer-config-rendered
  khal-config-rendered
  khal-initialized
)

depends_on "${targets[@]}"
