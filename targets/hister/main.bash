#!/usr/bin/env blarg

targets=(
  installed
  configured
)

depends_on "${targets[@]}"
