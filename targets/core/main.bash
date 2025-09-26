#!/usr/bin/env blarg

targets=(
  environment-configured
  local-bin-dir-created
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
)

depends_on "${targets[@]}"
