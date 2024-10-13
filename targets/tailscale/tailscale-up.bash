#!/usr/bin/env blarg

depends_on tailscale-service-running

reached_if() {
    tailscale status
}

apply() {
    if ! tailscale up; then
        sudo tailscale up --operator "${USER}"
    fi
}
