#!/usr/bin/env blarg

depends_on rush/main cli/qq-installed

PACKAGE_NAME="arch-news-check"

satisfied_if() {
  command -v arch-news-check
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
