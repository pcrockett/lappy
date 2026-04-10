#!/usr/bin/env blarg

targets=(
  tailscale/tailscale-service-running
  docker/started
  cli/pueue-started
  archive/started
)

depends_on "${targets[@]}"
