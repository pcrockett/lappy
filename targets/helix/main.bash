#!/usr/bin/env blarg

targets=(
    helix-installed
    hx-symlink-created
    helix-configured
    vscode-json-langserver-installed
    awk-language-server-installed
)

depends_on "${targets[@]}"
