#!/usr/bin/env blarg

PLUGIN_NAME="gleam"

depends_on \
    asdf/default-tools-configured \
    "asdf/${PLUGIN_NAME}-plugin-installed" \
    rebar-installed \
    erlang-installed

satisfied_if() {
    go_home
    test "$(asdf current --no-header "${PLUGIN_NAME}" | awk '{print $4}')" == "true"
}

apply() {
    go_home
    asdf install "${PLUGIN_NAME}"
}

go_home() {
    cd ~ || panic "unable to cd HOME?"
}
