#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    pyright-installed
)

depends_on "${targets[@]}"
