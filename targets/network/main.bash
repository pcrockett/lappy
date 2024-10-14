#!/usr/bin/env blarg

targets=(
    wlan-interface-config-placed
    network-services-started
)

depends_on "${targets[@]}"
