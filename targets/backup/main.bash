#!/usr/bin/env blarg

targets=(
  restic-installed
  cli-installed
  configured
)

depends_on "${targets[@]}"
