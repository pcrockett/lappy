#!/usr/bin/env blarg

depends_on rush-configured rush-installed

reached_if() {
    test -d "${RUSH_ROOT}/pcrockett"
}

apply() {
    rush clone pcrockett --ssh --default
}
