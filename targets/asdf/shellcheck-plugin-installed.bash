#!/usr/bin/env blarg

depends_on asdf-installed

PLUGIN_NAME="shellcheck"
PLUGIN_REPO="https://github.com/luizm/asdf-${PLUGIN_NAME}.git"

reached_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}