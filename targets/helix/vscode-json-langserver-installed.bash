#!/usr/bin/env blarg

depends_on pnpm-installed

# https://github.com/Microsoft/vscode/tree/main/extensions/json-language-features/server

NPM_PACKAGE="vscode-json-languageserver"

satisfied_if() {
    command -v "${NPM_PACKAGE}"
}

apply() {
    pnpm install -g "${NPM_PACKAGE}"
}
