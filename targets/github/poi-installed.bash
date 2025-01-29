#!/usr/bin/env blarg

depends_on github-cli-installed

EXTENSION_NAME="seachicken/gh-poi"

satisfied_if() {
    gh extension list | grep --fixed-strings --word-regexp "${EXTENSION_NAME}"
}

apply() {
    gh extension install "${EXTENSION_NAME}"
}
