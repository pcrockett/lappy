#!/usr/bin/env blarg

targets=(
    fly-cli-installed
    yaml-language-server-installed
)

depends_on "${targets[@]}"
