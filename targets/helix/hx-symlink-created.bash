#!/usr/bin/env blarg

depends_on helix-installed ../local-bin-dir-created ../bash-configured

reached_if() {
    command -v hx
}

apply() {
    ln --symbolic "$(command -v helix)" ~/.local/bin/hx
}
