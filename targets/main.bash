#!/usr/bin/env blarg

targets=(
    network/main
    core/main
    helix/main
    git/main
    cli/main
    web/main
    ssh/main
    rush/main
    nextcloud-installed
    bash-dev/main
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
    yubikey/main
    aur/main
    fzd/main
    comms/main
    mouse/main
    bitwarden/main
    archive/main
    backup/configured
    osm/main
    office/libreoffice-installed
    archiving/main
    media/main
    rust/main
    # bt/main  # not needed if you disable bluetooth in BIOS
    default-apps-configured
    meshtastic/main
    dev/main
    gleam/main
)

depends_on "${targets[@]}"
