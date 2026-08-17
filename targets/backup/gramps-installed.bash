#!/usr/bin/env blarg

depends_on rush/main age-installed

PACKAGE_NAME="gramps"

satisfied_if() {
  command -v "${PACKAGE_NAME}"
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
