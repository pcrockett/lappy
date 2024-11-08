#!/usr/bin/env blarg

targets=(
    asdf-installed
    bats-plugin-installed
    direnv-plugin-installed
    bashly-plugin-installed
    shellcheck-plugin-installed
    cue-plugin-installed
    shfmt-plugin-installed
)

depends_on "${targets[@]}"
