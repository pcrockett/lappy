#!/usr/bin/env blarg

targets=(
    mypy-installed
    pipx-installed
    pyright-installed
)

depends_on "${targets[@]}"
