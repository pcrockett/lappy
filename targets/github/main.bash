#!/usr/bin/env blarg

targets=(
    github-cli-installed
    actionlint-installed
    poi-installed
)

depends_on "${targets[@]}"
