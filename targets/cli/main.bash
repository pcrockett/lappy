#!/usr/bin/env blarg

targets=(
    kbg-installed
    nushell-installed
    git-main-installed
)

depends_on "${targets[@]}"
