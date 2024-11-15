#!/usr/bin/env blarg

depends_on asdf-installed

PLUGIN_NAME="nodejs"
PLUGIN_REPO="https://github.com/asdf-vm/asdf-${PLUGIN_NAME}.git"

satisfied_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}
