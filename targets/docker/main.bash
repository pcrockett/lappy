#!/usr/bin/env blarg

targets=(
    docker-installed
    docker-service-enabled
    added-to-docker-group
)

depends_on "${targets[@]}"
