#!/usr/bin/env blarg

depends_on asdf-installed gleam/erlang-installed

PLUGIN_NAME="rebar"
PLUGIN_REPO="https://github.com/pcrockett/asdf-${PLUGIN_NAME}.git"

satisfied_if() {
    asdf plugin list | grep --fixed-strings --line-regexp "${PLUGIN_NAME}"
}

apply() {
    asdf plugin add "${PLUGIN_NAME}" "${PLUGIN_REPO}"
}
