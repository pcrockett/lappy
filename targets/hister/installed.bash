#!/usr/bin/env blarg

PACKAGES=(
  github:asciimoo/hister
)

depends_on dev/mise-installed dev/mise-configured core/jq-installed

satisfied_if() {
  install_count="$(
    mise ls --global --installed --json "${PACKAGES[@]}" \
      | jq 'length'
  )"
  test "${install_count}" -eq "${#PACKAGES[@]}"
}

apply() {
  mise use --global "${PACKAGES[@]}"
}
