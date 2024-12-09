#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
    base-devel
    bat
    btop
    direnv
    fuse2
    fx
    gum
    jq
    pacman-contrib  # rankmirrors
    unzip
    ripgrep
    ueberzugpp  # image previews in terminal / yazi
    w3m
    yazi
)

snippet "packages-installed"
