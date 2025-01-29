#!/usr/bin/env blarg

targets=(
    mypy-installed
    pipx-installed
    pyright-installed
    dev/zeal-installed
)

depends_on "${targets[@]}"
