#!/usr/bin/env blarg

targets=(
    gleam-installed
    deno-installed
)

depends_on "${targets[@]}"
