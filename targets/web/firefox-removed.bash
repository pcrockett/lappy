#!/usr/bin/env blarg

satisfied_if() {
  ! command -v firefox && test ! -d ~/.mozilla
}

apply() {
  command -v firefox && as_root pacman -Rus --noconfirm firefox
  rm -rf ~/.mozilla
}
