#!/usr/bin/env blarg

depends_on tailscale-service-running

satisfied_if() {
    tailscale status
}

apply() {
    if ! tailscale up; then
        as_root tailscale up --operator "${USER}"
    fi
    tailscale set --accept-dns=false --accept-routes --exit-node-allow-lan-access
}
