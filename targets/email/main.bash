#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    # TODO: aerc configuration
)

depends_on "${targets[@]}"
