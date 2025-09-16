#!/usr/bin/env blarg

targets=(
  git-installed
  git-configured
  gitui-installed
  wipbr-installed
  git-publish-installed
  git-credit-installed
)

depends_on "${targets[@]}"
