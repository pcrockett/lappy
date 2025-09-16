#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="asdf"

satisfied_if() {
  command -v asdf
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
