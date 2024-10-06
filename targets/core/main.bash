#!/usr/bin/env blarg

targets=(
    bash-configured
    fish/main
    login-shell-configured
    man-installed
    direnv-installed
    btop-installed
    yazi-installed
    ripgrep-installed
    bat-installed
)

depends_on "${targets[@]}"
