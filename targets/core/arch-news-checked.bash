#!/usr/bin/env blarg

depends_on arch-news-check-installed network/main

apply() {
  arch-news-check || panic "News! Check out <https://archlinux.org/news/> and try again."
}
