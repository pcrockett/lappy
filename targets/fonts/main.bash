#!/usr/bin/env blarg

targets=(
    hack-nerd-font-installed
    noto-fonts-installed
    gnu-free-fonts-removed
    fontconfig-placed
)

depends_on "${targets[@]}"
