#!/usr/bin/env blarg

targets=(
    kbg-installed
    nushell-installed
    git-main-installed
    fzman-installed
    pubip-installed
)

depends_on "${targets[@]}"
