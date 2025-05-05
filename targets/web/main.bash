#!/usr/bin/env blarg

targets=(
    firefox-installed
    librewolf-installed
    profile-sync-daemon-started
)

depends_on "${targets[@]}"
