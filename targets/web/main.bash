#!/usr/bin/env blarg

targets=(
  librewolf-installed
  firefox-removed
  profile-sync-daemon-started
)

depends_on "${targets[@]}"
