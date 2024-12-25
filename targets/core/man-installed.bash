#!/usr/bin/env blarg

satisfied_if() {
    package_is_installed man-db
}

apply() {
    satisfy network/main
    satisfy arch-news-checked
    # satisfy snapshots/created
    install_package man-db
    as_root mandb  # generate mandb cache so it can be searched
}
