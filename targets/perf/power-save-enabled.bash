#!/usr/bin/env blarg

# depends_on something

satisfied_if() {
  false
}

apply() {
  tailscale down
  as_root systemctl stop tailscaled
  as_root systemctl stop docker.socket
  as_root systemctl stop docker.service
  as_root systemctl stop containerd.service
  systemctl --user stop pueued.service
  systemctl --user stop rclone-archive.service
  echo '0' >'/proc/sys/kernel/nmi_watchdog'
  iw dev wlan0 set power_save on
}
