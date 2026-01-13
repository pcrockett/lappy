#!/usr/bin/env blarg

targets=(
  ssh-key-generated
  client-config-placed
)

depends_on "${targets[@]}"
