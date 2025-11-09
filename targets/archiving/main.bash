#!/usr/bin/env blarg

targets=(
  podcast-archiver-installed
  podcast-archiver-configured
  kiwix-installed
)

depends_on "${targets[@]}"
