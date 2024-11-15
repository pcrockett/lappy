#!/usr/bin/env blarg

depends_on asdf-installed nodejs-plugin-installed

PLUGIN_NAME="pnpm"
PLUGIN_REPO="https://github.com/jonathanmorley/asdf-${PLUGIN_NAME}.git"

satisfied_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}
