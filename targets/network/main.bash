#!/usr/bin/env blarg

targets=(
    dns-defaults-placed
    network-config-placed
    network-services-started
    mullvad-dns-enabled
)

depends_on "${targets[@]}"
