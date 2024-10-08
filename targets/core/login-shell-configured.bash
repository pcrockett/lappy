#!/usr/bin/env blarg

depends_on fish/main

FISH_PATH="$(command -v fish)"

reached_if() {
    test "${SHELL}" == "${FISH_PATH}"
}

apply() {
    sudo chsh --shell "${FISH_PATH}" "${USER}"
}
