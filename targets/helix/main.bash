#!/usr/bin/env blarg

targets=(
  @pcrockett:helix/main
  vscode-json-langserver-installed
  awk-language-server-installed
)

depends_on "${targets[@]}"
