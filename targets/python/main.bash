#!/usr/bin/env blarg

targets=(
    pipx-installed
    mypy-installed
    pylsp-installed
)

depends_on "${targets[@]}"
