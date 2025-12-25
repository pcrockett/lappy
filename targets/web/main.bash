#!/usr/bin/env blarg

targets=(
  librewolf-installed
  firefox-removed
  profile-sync-daemon-started
  epiphany-installed # lighter-weight alternative to electron
)

depends_on "${targets[@]}"
