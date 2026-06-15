#!/usr/bin/env blarg

targets=(
  @pcrockett:archlinux/docker/socket-started
  added-to-docker-group
  distrobox-installed
)

depends_on "${targets[@]}"
