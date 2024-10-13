#!/usr/bin/env blarg

targets=(
    bash-configured
    fish/main
    login-shell-configured
    man-db-enabled
    direnv-installed
    btop-installed
    yazi-installed
    ripgrep-installed
    bat-installed
    fx-installed
    gum-installed
)

depends_on "${targets[@]}"
