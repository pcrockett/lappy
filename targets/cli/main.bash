#!/usr/bin/env blarg

targets=(
    kbg-installed
    nushell-installed
    git-main-installed
    fzman-installed
    pubip-installed
    starship-installed
    librespeed-cli-installed
    tagref-installed
    alacritty-configured
    mtr-installed
    wikiman-installed
    srch-installed
)

depends_on "${targets[@]}"
