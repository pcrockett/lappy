#!/usr/bin/env blarg

THE_GROUP="uucp"

satisfied_if() {
  groups | grep --word-regexp "${THE_GROUP}"
}

apply() {
  as_root usermod --append --groups "${THE_GROUP}" "${USER}"
  echo "User added to \`${THE_GROUP}\` group. Log out and in for settings to take effect."
}
