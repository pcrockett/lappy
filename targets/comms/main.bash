#!/usr/bin/env blarg

targets=(
  email/main
  siggy-installed
  simplex-tui-installed
  profanity-installed
)

depends_on "${targets[@]}"
