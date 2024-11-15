#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="pactl_volume"

reached_if() {
    command -v pactl_volume
}

apply() {
    satisfy rush/rush-repo-pulled
    rush get "${PACKAGE_NAME}"
}
