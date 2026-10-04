#!/usr/bin/env blarg

depends_on mise/installed mise/configured core/jq-installed

satisfied_if() {
  missing_tools="$(mise ls --json --global --missing | jq --raw-output 'keys | length')"
  test "${missing_tools}" -eq 0
}

apply() {
  # mise reads local config when it exists. create an empty dir to run the mise command,
  # to guarantee it isn't looking at the local config
  temp_dir="$(mktemp --directory)"

  # shellcheck disable=SC2329  # cleanup is called by the trap
  cleanup() {
    rm -r "${temp_dir}"
  }
  trap 'cleanup' EXIT ERR

  mise --cd "${temp_dir}" install
}
