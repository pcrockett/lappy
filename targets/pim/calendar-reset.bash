#!/usr/bin/env blarg

# This target isn't (or shouldn't) be included as a dependency in any other targets. It
# only exists to easily reset the state of calendaring on a laptop where lappy is being
# developed. Use `make run-target` to run it; otherwise, it should absolutely not be a
# normal thing to run.

DIRS_TO_DELETE=(
  "${HOME}/.config/khal"
  "${HOME}/.config/vdirsyncer"
  "${HOME}/.local/share/khal"
  "${HOME}/.local/share/lappy-pim"
  "${HOME}/.local/share/vdirsyncer"
)

satisfied_if() {
  for dir in "${DIRS_TO_DELETE[@]}"; do
    test ! -d "${dir}" || exit 1
  done
}

apply() {
  rm -rf -- "${DIRS_TO_DELETE[@]}"
}
