#!/usr/bin/env blarg

depends_on rush/main core/login-shell-configured

PACKAGE_NAME="deno"

satisfied_if() {
    command -v deno
}

apply() {
    if [ "${DENO_INSTALL:-}" == "" ]; then
        panic "DENO_INSTALL must be set. Are you running a fully-configured fish?"
    fi

    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
