#!/usr/bin/env blarg

depends_on timeshift-installed grub-btrfsd-started

apply() {
  as_root timeshift --create --scripted --comments "lappy snapshot"
}
