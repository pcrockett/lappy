#!/usr/bin/env blarg

reached_if() {
    command -v man
}

apply() {
    install_package man-db
}
