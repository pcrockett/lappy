#!/usr/bin/env blarg

depends_on pipx-installed

satisfied_if() {
    command -v pylsp
}

apply() {
    pipx install "python-lsp-server[yapf,pycodestyle,pyflakes,rope]"
}
