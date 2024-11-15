#!/usr/bin/env blarg

targets=(
    ykman-installed
    pcscd-started
    fztotp-installed
)

depends_on "${targets[@]}"
