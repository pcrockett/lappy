#!/usr/bin/env blarg

depends_on rush-configured rush-installed ssh/ssh-key-generated

satisfied_if() {
  test -d "${RUSH_ROOT}/pcrockett/rush-repo/.git"
}

apply() {
  rush clone pcrockett --ssh --default
}
