#!/usr/bin/env blarg

depends_on rush/main core/main  # need fuse2 at least

PACKAGE_NAME="nextcloud-desktop"

satisfied_if() {
    command -v Nextcloud.AppImage
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
