#!/usr/bin/env blarg

satisfied_if() {
  ! tailscale status
}

apply() {
  tailscale down
}
