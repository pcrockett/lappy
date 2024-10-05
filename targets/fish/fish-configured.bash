#!/usr/bin/env blarg

reached_if() {
    test -f ~/.config/fish/.phil-fish-config
}

apply() {
    rm -r ~/.config/fish
    ln --symbolic "${BLARG_CWD}/config/fish" ~/.config/fish
}
