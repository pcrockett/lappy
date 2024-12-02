#!/usr/bin/env blarg

depends_on pacman-deps-installed rbw-configured

satisfied_if() {
    # i'm not 100% sure this is the correct way to tell if it's satisfied -- need to test on a
    # fresh install, but don't want to at the moment.
    test -f "${HOME}/.local/share/rbw/device_id"
}

apply() {
    rbw register
}
