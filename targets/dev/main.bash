#!/usr/bin/env blarg

targets=(
  fly-cli-installed
  yaml-language-server-installed
  delta-installed
  copier-installed
  yamllint-installed
  just-installed
  android-tools-installed
  mise-installed
  mise-configured
  yamlfmt-installed
  deno-installed
)

depends_on "${targets[@]}"
