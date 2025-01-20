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
    aria2-installed
    fastfetch-installed
)

depends_on "${targets[@]}"
