#!/usr/bin/env blarg

targets=(
    dns-defaults-placed
    network-config-placed
    network-services-started
    lappy-dns-enabled
)

depends_on "${targets[@]}"
