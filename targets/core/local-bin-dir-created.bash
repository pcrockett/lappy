#!/usr/bin/env blarg

satisfied_if() {
  test -d ~/.local/bin
}

apply() {
  mkdir --parent ~/.local/bin
}
