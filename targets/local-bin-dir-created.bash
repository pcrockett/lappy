#!/usr/bin/env blarg

reached_if() {
    test -d ~/.local/bin
}

apply() {
    mkdir --parent ~/.local/bin
}
