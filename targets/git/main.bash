#!/usr/bin/env blarg

targets=(
    git-installed
    git-configured
    gitui-installed
)

depends_on "${targets[@]}"
