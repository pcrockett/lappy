#!/usr/bin/env blarg

targets=(
    kbg-installed
    nushell-installed
    git-main-installed
    fzman-installed
    pubip-installed
    starship-installed
)

depends_on "${targets[@]}"
