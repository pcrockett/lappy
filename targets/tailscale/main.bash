#!/usr/bin/env blarg

targets=(
    tailscale-up
    mullvad-shuffle-installed
)

depends_on "${targets[@]}"
