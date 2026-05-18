#!/usr/bin/env blarg

LAYOUT=us
MODEL=pc105+inet
VARIANT="" # don't specify, refers to things like dvorak or workman
OPTIONS=compose:ralt,terminate:ctrl_alt_bksp

satisfied_if() {
  status="$(localectl status)"
  for s in "X11 Layout: ${LAYOUT}" "X11 Model: ${MODEL}" "X11 Options: ${OPTIONS}"; do
    echo "${status}" | grep --fixed-strings "${s}" || exit 1
  done
}

apply() {
  as_root localectl set-x11-keymap "${LAYOUT}" "${MODEL}" "${VARIANT}" "${OPTIONS}"
}
