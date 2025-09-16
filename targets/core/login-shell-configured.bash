#!/usr/bin/env blarg

depends_on fish/main

FISH_PATH="$(command -v fish)"

satisfied_if() {
  test "${SHELL}" == "${FISH_PATH}"
}

apply() {
  as_root chsh --shell "${FISH_PATH}" "${USER}"
}
