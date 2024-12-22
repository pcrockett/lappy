#!/usr/bin/env blarg

# TODO: reduce this list to nothing. core targets should be specific dependencies of other actual
# "use case" targets.
targets=(
    pacman-deps-installed
    bash-configured
    fish/main
    login-shell-configured
    man-db-enabled
    man-pages-installed
    fzf-installed
    direnv-configured
)

depends_on "${targets[@]}"
