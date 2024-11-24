#!/usr/bin/env blarg

# https://wiki.archlinux.org/title/Dictd

targets=(
    dictd-installed
    fzd-installed
    dictionaries-installed
    dictd-started
)

depends_on "${targets[@]}"
