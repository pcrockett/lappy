#!/usr/bin/env blarg

targets=(
  shellcheck-installed
  bash-language-server-installed
)

depends_on "${targets[@]}"
