#!/usr/bin/env blarg

reached_if() {
    command -v man
}

apply() {
    install_package man-db
    sudo mandb  # generate mandb cache so it can be searched
}
