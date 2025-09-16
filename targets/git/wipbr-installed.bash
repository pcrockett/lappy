#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="git-wipbr"

satisfied_if() {
  command -v git-wipbr
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
