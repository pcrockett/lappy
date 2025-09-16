#!/usr/bin/env blarg

depends_on rush/main core/jq-installed core/gum-installed

PACKAGE_NAME="pubip"

satisfied_if() {
  command -v "${PACKAGE_NAME}"
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
