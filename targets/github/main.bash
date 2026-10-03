#!/usr/bin/env blarg

targets=(
  github-cli-installed
  actionlint-installed
  poi-installed
  dash-installed
  dash-configured
  git-pr-installed
)

depends_on "${targets[@]}"
