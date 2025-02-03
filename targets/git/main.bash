#!/usr/bin/env blarg

targets=(
    git-installed
    git-configured
    gitui-installed
    wipbr-installed
)

depends_on "${targets[@]}"
