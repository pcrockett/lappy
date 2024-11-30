#!/usr/bin/env blarg

targets=(
    pacman-deps-installed
    bash-configured
    fish/main
    login-shell-configured
    man-db-enabled
    fzf-installed
    direnv-configured
)

depends_on "${targets[@]}"
