#!/usr/bin/env blarg

targets=(
  github-cli-installed
  actionlint-installed
  poi-installed
  git-pr-installed
)

depends_on "${targets[@]}"
