#!/usr/bin/env blarg

DEPENDENCIES=(
  daemon-config-placed
  @pcrockett:archlinux/docker/started
)

depends_on "${DEPENDENCIES[@]}"
