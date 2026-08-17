#!/usr/bin/env blarg

depends_on core/environment-configured core/fish/fish-configured

satisfied_if() {
  test "${RUSH_ROOT:-}" != "" \
    && test "${RUSH_CONFIG:-}" != "" \
    && test -d "${RUSH_ROOT}" \
    && test -f "${RUSH_CONFIG}"
}

apply() {
  if [ "${RUSH_ROOT:-}" == "" ] || [ "${RUSH_CONFIG:-}" == "" ]; then
    panic "RUSH_ROOT and RUSH_CONFIG env variables not set. Do you need to log out and back in?"
  fi

  mkdir --parent "$(dirname "${RUSH_CONFIG}")"
  mkdir --parent "${RUSH_ROOT}"
}
