#!/usr/bin/env blarg

targets=(
    wlan-interface-config-placed
    network-services-started
    mullvad-dns-enabled
)

depends_on "${targets[@]}"
