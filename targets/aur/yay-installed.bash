#!/usr/bin/env blarg

depends_on rush/main git/git-installed core/base-devel-installed

PACKAGE_NAME="yay"

satisfied_if() {
  command -v yay
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
