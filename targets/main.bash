#!/usr/bin/env blarg

targets=(
  network/main
  core/main
  helix/main
  git/main
  cli/main
  web/main
  ssh/main
  rush/main
  bash-dev/main
  python/main
  desktop/main
  docker/main
  fonts/main
  tailscale/main
  asdf/main
  firewall/main
  github/main
  yubikey/main
  aur/main
  fzd/main
  comms/main
  mouse/main
  bitwarden/main
  archive/main
  backup/main
  osm/main
  office/main
  archiving/main
  media/main
  rust/main
  meshtastic/main
  dev/main
  scanner/main
  printer/main
  pim/main
  virt/main
)

depends_on "${targets[@]}"
