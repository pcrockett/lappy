#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="rust-analyzer"

satisfied_if() {
  command -v "${PACKAGE_NAME}" && "${PACKAGE_NAME}" --version
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
