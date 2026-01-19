#!/usr/bin/env blarg

targets=(
  root-bash-configured
  environment-configured
  local-bin-dir-created
  mirrorlist-sorted
  pacman-deps-installed
  bash-configured
  fish/main
  login-shell-configured
  man-db-enabled
  man-pages-installed
  fzf-installed
  direnv-configured
  sudo-configured
  net-tools-installed
  updater-installed
)

depends_on "${targets[@]}"
