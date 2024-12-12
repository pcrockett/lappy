#!/usr/bin/env blarg

depends_on core/bash-configured core/fish/main

satisfied_if() {
    test -d "${RUSH_ROOT}" && test -f "${RUSH_CONFIG}"
}

apply() {
    mkdir --parent "$(dirname "${RUSH_CONFIG}")"
    mkdir --parent "${RUSH_ROOT}"
}
