#!/usr/bin/env blarg

depends_on pacman-deps-installed

satisfied_if() {
    rbw config show | grep --fixed-strings "${BITWARDEN_EMAIL}"
}

apply() {
    rbw config set email "${BITWARDEN_EMAIL}"
}
