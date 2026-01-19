#!/usr/bin/env blarg

depends_on network/main with-umask-installed reflector-installed

satisfied_if() {
  checkpoint_is_current
}

apply() {
  temp_dir="$(mktemp --directory)"

  bring_down="$(needs_tailscale_down)"
  if [ "${bring_down}" = "true" ]; then
    echo "bringing tailscale down..."
    tailscale down
    echo "done: tailscale down"
  fi

  # shellcheck disable=SC2329  # shellcheck can't see that this function is being called by a trap
  cleanup() {
    rm -rf "${temp_dir}"
    if [ "${bring_down}" = "true" ]; then
      echo "bringing tailscale back up..."
      tailscale up
      echo "done: tailscale up"
    fi
  }
  trap 'cleanup' EXIT

  echo "generating mirrorlist..."
  reflector \
    --country "${PACMAN_REPOSITORY_REGION}" \
    --age 24 \
    --protocol https \
    --sort rate \
    >"${temp_dir}/mirrorlist"

  as_root cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
  as_root with-umask u=rw,g=r,o=r cp "${temp_dir}/mirrorlist" /etc/pacman.d/mirrorlist

  checkpoint_success
}

needs_tailscale_down() {
  command -v tailscale &>/dev/null \
    && tailscale status &>/dev/null \
    && echo "true"
}
