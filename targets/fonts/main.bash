#!/usr/bin/env blarg

targets=(
    hack-nerd-font-installed
    noto-fonts-installed
    gnu-free-fonts-removed
)

depends_on "${targets[@]}"
