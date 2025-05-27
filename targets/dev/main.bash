#!/usr/bin/env blarg

targets=(
    fly-cli-installed
    yaml-language-server-installed
    delta-installed
)

depends_on "${targets[@]}"
