#!/usr/bin/env blarg

targets=(
  email/main
  gurk-installed
  gurk-configured
  simplex-tui-installed
  profanity-installed
)

depends_on "${targets[@]}"
