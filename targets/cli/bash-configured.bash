#!/usr/bin/env blarg

LINE_TO_ADD="source '${BLARG_CWD}/config/bash/bashrc'"

reached_if() {
    grep --fixed-strings "${LINE_TO_ADD}" ~/.bashrc
}

apply() {
    echo "${LINE_TO_ADD}" >> ~/.bashrc
    echo "Bash successfully configured. Close your terminal and restart it."
    exit 1
}
