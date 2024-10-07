#!/usr/bin/env blarg

targets=(
    bluetooth-service-active
    not-auto-enabled
)

depends_on "${targets[@]}"
