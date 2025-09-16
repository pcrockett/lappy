#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
    man-pages
)

depends_on man-installed

satisfied_if() {
    package_is_installed "${PACKAGES[@]}"
}

apply() {
    satisfy network/main arch-news-checked # snapshots/created
    install_package "${PACKAGES[@]}"
    as_root mandb # generate mandb cache so it can be searched
}
