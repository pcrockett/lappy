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
    sleep-configured
    python/main
    rofi/main
    qtile-configured
    docker/main
    alacritty-configured
    fonts/main
    tailscale/main
)

depends_on "${targets[@]}"
