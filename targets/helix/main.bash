#!/usr/bin/env blarg

targets=(
    helix-installed
    hx-symlink-created
    helix-configured
    # markdown-oxide-installed
    vscode-json-langserver-installed
)

depends_on "${targets[@]}"
