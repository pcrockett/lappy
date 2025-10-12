#!/usr/bin/env blarg

targets=(
  fly-cli-installed
  yaml-language-server-installed
  delta-installed
  copier-installed
  yamlfmt-installed
  yamllint-installed
)

depends_on "${targets[@]}"
