#!/usr/bin/env blarg

# need arch-news-check so updater will abort updates when we haven't seen the latest news
depends_on rush/main arch-news-check-installed

PACKAGE_NAME="updater"

satisfied_if() {
  command -v software-update
}

apply() {
  satisfy rush/rush-repo-pulled
  rush get "${PACKAGE_NAME}"
}
