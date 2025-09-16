#!/usr/bin/env blarg

targets=(
  v4-service-enabled
  v6-service-enabled
)

depends_on "${targets[@]}"
