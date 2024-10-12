#!/usr/bin/env blarg

targets=(
    core/main
    helix/main
    git/main
    cli/main
    github-cli-installed
    firefox-installed
    ssh/main
    rush/main
    nextcloud-installed
    bash-dev/main
    bluetooth-killed
    python/main
    rofi/main
    hack-nerd-font-installed
    qtile-configured
    docker/main
    alacritty-configured
    gnu-free-fonts-removed
)

depends_on "${targets[@]}"
