#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    pylsp-installed
)

depends_on "${targets[@]}"
