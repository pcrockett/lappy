#!/usr/bin/env blarg

depends_on rush/main fuse2-installed

PACKAGE_NAME="nextcloud-desktop"

reached_if() {
    command -v Nextcloud.AppImage
}

apply() {
    rush get "${PACKAGE_NAME}"
}
