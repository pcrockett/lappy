#!/usr/bin/env blarg

DEPENDENCIES=(
  installed
  daemon-config-placed
  buildkit-config-placed
  @pcrockett:archlinux/docker/started
)

depends_on "${DEPENDENCIES[@]}"
