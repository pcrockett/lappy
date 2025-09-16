#!/usr/bin/env blarg

depends_on environment-configured

LINE_TO_ADD="source '${BLARG_CWD}/config/bash/bashrc'" # [ref:lappy-bashrc]

satisfied_if() {
    grep --fixed-strings "${LINE_TO_ADD}" ~/.bashrc
}

apply() {
    echo "${LINE_TO_ADD}" >>~/.bashrc
    echo "Bash successfully configured."
}
