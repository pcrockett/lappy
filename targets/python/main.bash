#!/usr/bin/env blarg

targets=(
    mypy-installed
    pipx-installed
    pyright-installed
    dev/zeal-installed
    pre-commit-installed
    asdf/python-plugin-installed
)

depends_on "${targets[@]}"
