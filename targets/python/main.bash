#!/usr/bin/env blarg

targets=(
  mypy-installed
  pipx-installed
  pyright-installed
  dev/zeal-installed
  pre-commit-installed
  asdf/python-plugin-installed
  uv-installed
)

depends_on "${targets[@]}"
