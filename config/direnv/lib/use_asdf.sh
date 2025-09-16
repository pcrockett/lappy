# shellcheck shell=bash

use_asdf() {
  asdf install || true
  watch_file "${ASDF_DEFAULT_TOOL_VERSIONS_FILENAME:-.tool-versions}"
}
