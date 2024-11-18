#!/usr/bin/env blarg

depends_on pacman-deps-installed

satisfied_if() {
    command -v pylsp
}

apply() {
    pipx install "python-lsp-server[yapf,pycodestyle,pyflakes,rope]"
}
