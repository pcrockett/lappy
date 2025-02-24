#!/usr/bin/env blarg

targets=(
    sleep-configured
    bluetooth-disabled-on-startup
)

depends_on "${targets[@]}"
