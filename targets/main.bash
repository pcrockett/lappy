#!/usr/bin/env blarg

targets=(
    cli/main
    helix/main
    git/main
    github-cli-installed
    firefox-installed
    ssh/main
    rush/main
    nextcloud-installed
)

depends_on "${targets[@]}"
