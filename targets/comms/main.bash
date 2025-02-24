#!/usr/bin/env blarg

targets=(
    email/main
    gurk-installed
    gurk-configured
)

depends_on "${targets[@]}"
