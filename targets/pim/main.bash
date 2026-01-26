#!/usr/bin/env blarg

# wip
targets=(
  vdirsyncer-installed
  khal-installed
  vdirsyncer-config-rendered
  khal-config-rendered
  khal-initialized
  taskwarrior-installed
  taskwarrior-configured
  todoman-installed # for interoperability with phone
  todoman-configured
  tw-installed
)

depends_on "${targets[@]}"
