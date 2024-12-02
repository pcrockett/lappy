#!/usr/bin/env blarg

depends_on pacman-deps-installed rbw-configured

satisfied_if() {
    test -f "${HOME}/.local/share/rbw/device_id"
}

apply() {
    rbw register
}
