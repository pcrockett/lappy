#!/usr/bin/env blarg

LIMIT="73400320" # 70 MiB per second

satisfied_if() {
  root_device="$(
    findmnt --output source --noheadings / \
      | awk '{gsub(/\[.+]$/, ""); print $0}'
  )"
  current_limit="$(
    btrfs scrub limit --raw / | awk "\$3 == \"${root_device}\" {print \$2}"
  )"
  test "${current_limit}" == "${LIMIT}"
}

apply() {
  as_root btrfs scrub limit --limit "${LIMIT}" --all /
}
