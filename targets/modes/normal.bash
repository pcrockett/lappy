#!/usr/bin/env blarg

targets=(
  tailscale/tailscale-service-running
  docker/docker-service-enabled
  cli/pueue-started
  archive/started
)

depends_on "${targets[@]}"
