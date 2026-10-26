#!/usr/bin/env blarg

depends_on tailscale-service-running

satisfied_if() {
  tailscale status
}

apply() {
  if ! tailscale up; then
    as_root tailscale up --operator "${USER}"
  fi

  # btw, if you want --exit-node-allow-lan-access, you have to specify that at the same
  # time as you specify the exit node. it's not a switch you can just turn on.
  tailscale set --accept-dns --accept-routes
}
