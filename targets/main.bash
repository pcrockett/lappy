#!/usr/bin/env blarg

targets=(
    network/main
    core/main
    helix/main
    git/main
    cli/main
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
    fonts/main
    tailscale/main
    asdf/main
    firewall/main
    updater-installed
    github/main
    signal-installed
    yubikey/main
    aur/main
    fzd/main
    email/main
    mouse/main
    bitwarden/main
    archive/main
    backup/configured
    osm/main
)

depends_on "${targets[@]}"
