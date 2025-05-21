#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    bash-configured
    fish/main
    login-shell-configured
    man-db-enabled
    man-pages-installed
    fzf-installed
    direnv-configured
    sudo-configured
    net-tools-installed
)

depends_on "${targets[@]}"
