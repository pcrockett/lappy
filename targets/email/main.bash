#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    aerc-configured
)

depends_on "${targets[@]}"
