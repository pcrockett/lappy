#!/usr/bin/env blarg

targets=(
  shellcheck-installed
  shfmt-installed
  bash-language-server-installed
)

depends_on "${targets[@]}"
