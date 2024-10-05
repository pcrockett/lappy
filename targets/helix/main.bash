#!/usr/bin/env blarg

targets=(
    helix-installed
    hx-symlink-created
    helix-configured
)

depends_on "${targets[@]}"
