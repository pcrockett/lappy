#!/usr/bin/env blarg

targets=(
    helix/main
    bash-configured
    git/main
    fish/main
    yazi-installed
    man-installed
    login-shell-configured
    btop-installed
    firefox-installed
    direnv/main
    ssh/main
)

depends_on "${targets[@]}"
