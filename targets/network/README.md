# Networking

I'm using built-in `systemd-networkd` and `systemd-resolved` for basic network config.

I'm using `iwd` to manage WLAN.

Good networking docs in Arch Wiki systemd-networkd page.

Followed instructions in Arch wiki "iwd" page to connect via `iwd`.

**tl;dr:**

```bash
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect "${SSID}"
```
