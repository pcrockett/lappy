#!/usr/bin/env blarg

targets=(
  docker-installed
  docker-service-enabled
  added-to-docker-group
  distrobox-installed
)

depends_on "${targets[@]}"
