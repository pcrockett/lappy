#!/usr/bin/env blarg

depends_on rush/main tailscale-installed

PACKAGE_NAME="mullvad-shuffle"

satisfied_if() {
  command -v mullvad-shuffle
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
