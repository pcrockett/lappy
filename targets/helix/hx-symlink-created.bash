#!/usr/bin/env blarg

depends_on helix-installed ../local-bin-dir-created ../core/main

satisfied_if() {
    command -v hx
}

apply() {
    ln --symbolic "$(command -v helix)" ~/.local/bin/hx
}
