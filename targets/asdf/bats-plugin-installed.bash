#!/usr/bin/env blarg

depends_on asdf-installed

PLUGIN_NAME="bats"
PLUGIN_REPO="git@github.com:pcrockett/asdf-${PLUGIN_NAME}"

satisfied_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}
