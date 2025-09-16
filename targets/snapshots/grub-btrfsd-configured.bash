#!/usr/bin/env blarg

depends_on grub-btrfs-installed

REPO_FILE="${BLARG_CWD}/config/grub-btrfsd/grub-btrfsd.service"
SYSTEM_FILE="/etc/systemd/system/grub-btrfsd.service"

satisfied_if() {
  files_are_same "${REPO_FILE}" "${SYSTEM_FILE}"
}

apply() {
  as_root systemctl edit --full --stdin grub-btrfsd.service <"${REPO_FILE}"
}
