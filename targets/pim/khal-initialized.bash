#!/usr/bin/env blarg

depends_on vdirsyncer-config-rendered khal-config-rendered vdirsyncer-installed khal-installed

satisfied_if() {
  khal at 2025-10-19 20:00 | grep --fixed-strings "khal marker"
}

apply() {
  # `vdirsyncer` will give us an interactive prompt asking if we want to create new
  # local data storages on the file system. Answer "Y" to those.
  echo "--> discovering..."
  yes | vdirsyncer discover || {
    # `yes` will exit with a non-zero status (141) because the pipe gets closed
    # before `yes` is finished writing to it. we don't care about `yes`; we care about
    # the status of `vdirsyncer discover`.
    discover_status="${PIPESTATUS[1]}"
    if [ "${discover_status}" != 0 ]; then
      panic "\`vdirsyncer discover\` exited with code ${discover_status}"
    fi
  }

  echo "--> syncing..."
  vdirsyncer sync

  echo "--> running \`khal list\`..."
  khal list
}
