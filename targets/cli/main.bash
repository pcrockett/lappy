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
    bitwarden-device-registered
)

depends_on "${targets[@]}"
