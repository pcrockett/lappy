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
    bluetooth-disabled-on-startup
    python/main
    rofi/main
    qtile-configured
    docker/main
    alacritty-configured
    fonts/main
    tailscale/main
    asdf/main
    direnv-configured
    wikiman-installed
    firewall/main
)

depends_on "${targets[@]}"
