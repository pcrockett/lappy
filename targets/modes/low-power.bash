#!/usr/bin/env blarg

targets=(
  tailscale/tailscale-service-stopped
  docker/daemon-stopped
  docker/containerd-stopped
  cli/pueue-stopped
  archive/stopped
)

depends_on "${targets[@]}"
