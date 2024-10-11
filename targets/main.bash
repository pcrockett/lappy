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
    qtile-configured
    docker/main
    rofi/main
    hack-nerd-font-installed
)

depends_on "${targets[@]}"
