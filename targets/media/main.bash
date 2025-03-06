#!/usr/bin/env blarg

targets=(
    vlc-installed
    newsboat-installed
    newsboat-configured
)

depends_on "${targets[@]}"
