#!/usr/bin/env blarg

LOCAL_CONFIG="${BLARG_CWD}/config/helix"
HELIX_CONFIG=~/.config/helix

satisfied_if() {
  test_symlink "${LOCAL_CONFIG}" "${HELIX_CONFIG}"
}

apply() {
  rm -rf "${HELIX_CONFIG}"
  ln --symbolic "${LOCAL_CONFIG}" "${HELIX_CONFIG}"
}
