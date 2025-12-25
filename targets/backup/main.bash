#!/usr/bin/env blarg

targets=(
  restic-installed
  cli-installed
  configured
  gramps-installed
)

depends_on "${targets[@]}"
