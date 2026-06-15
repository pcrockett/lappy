#!/usr/bin/env blarg

targets=(
  added-to-docker-group
  distrobox-installed
)

depends_on "${targets[@]}"
