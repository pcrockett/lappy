#!/usr/bin/env blarg

depends_on asdf-installed core/direnv-installed core/direnv-configured

PLUGIN_NAME="direnv"
PLUGIN_REPO="https://github.com/asdf-community/asdf-${PLUGIN_NAME}.git"

satisfied_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}
