#!/usr/bin/env blarg

targets=(
    asdf-installed
    bats-plugin-installed
    direnv-plugin-installed
)

depends_on "${targets[@]}"
