#!/usr/bin/env blarg

satisfied_if() {
    test -f ~/.ssh/id_ed25519
}

apply() {
    ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -a 300
}
