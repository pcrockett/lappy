#!/usr/bin/env blarg

targets=(
    asdf-installed
    bats-plugin-installed
    bashly-plugin-installed
    shellcheck-plugin-installed
    cue-plugin-installed
    shfmt-plugin-installed
    nodejs-plugin-installed
    pnpm-plugin-installed
    age-plugin-installed
    default-tools-configured
    default-tools-installed
)

depends_on "${targets[@]}"
