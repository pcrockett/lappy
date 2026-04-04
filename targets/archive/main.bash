#!/usr/bin/env blarg

targets=(
  configured
  started
  copyparty-installed
)

depends_on "${targets[@]}"
