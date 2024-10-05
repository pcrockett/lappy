# Pre-automation notes

In the arch installer I installed the Desktop / Qtile profile.

Good networking docs in Arch Wiki systemd-networkd page.

```bash
systemctl enable --now systemd-networkd
systemctl enable --now systemd-resolved
systemctl enable --now iwd
```

Created wlan.network in /etc/systemd/network

Followed instructions in Arch wiki "iwd" page to connect via `iwd`:

```bash
iwctl station wlan0 scan
iwctl station wlan0 get-networks
iwctl station wlan0 connect "${SSID}"
```

Network bootstrapped!

```bash
mkdir ~/.config/beekrpad/bin
cd ~/.config/beekrpad/bin
wget https://github.com/pcrockett/blarg/raw/main/blarg
chmod +x blarg
```

Then I started hacking out this repository with `nano`, then `helix` / `hx`.

Then set git basic settings:

```bash
git config --global init.defaultBranch main
git config --global user.email contact@philcrockett.com
git config --global user.name "Phil Crockett"
```

... and now everything else can be tracked via this repository. Just run `make`.
