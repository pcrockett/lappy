#!/usr/bin/env blarg

targets=(
    helix/main
    bash-configured
    git/main
    github-cli-installed
    fish/main
    yazi-installed
    man-installed
    login-shell-configured
    btop-installed
    firefox-installed
    direnv/main
    ssh/main
    rush/main
    nextcloud-installed
)

depends_on "${targets[@]}"
