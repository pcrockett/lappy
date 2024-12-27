#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    kbg-installed
    git-main-installed
    fzman-installed
    pubip-installed
    librespeed-cli-installed
    tagref-installed
    alacritty-configured
    srch-installed
    starship-configured
    fzmake-installed
    archwiki-installed
    httpie-installed
)

depends_on "${targets[@]}"
