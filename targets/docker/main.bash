#!/usr/bin/env blarg

targets=(
  started
  added-to-docker-group
  distrobox-installed
)

depends_on "${targets[@]}"
