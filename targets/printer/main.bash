#!/usr/bin/env blarg

targets=(
  cups-installed
  cups-socket-enabled
  brother-printer-added
)

depends_on "${targets[@]}"
