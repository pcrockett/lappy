#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    nushell-installed
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
    ouch-installed
    pandoc-installed
    tree-installed
    core/bat-installed
    askii-installed
)

depends_on "${targets[@]}"
