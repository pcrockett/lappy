#!/usr/bin/env blarg

reached_if() {
    package_is_installed man-db
}

apply() {
    install_package man-db
    sudo mandb  # generate mandb cache so it can be searched
}
