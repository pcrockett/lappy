#!/usr/bin/env blarg

depends_on rush/main

PACKAGE_NAME="with-umask"

satisfied_if() {
  command -v with-umask
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
