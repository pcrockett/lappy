# lappy

My "tinkering" laptop config.

This is developed and tested on a Lenovo Thinkpad X200.

## Getting started

This repo configures a Linux system after a fresh install of Arch (btw).

Before installing Arch, clone this repository to a flash drive (separate from the drive with the
ISO install media). When [running the Arch installer](https://wiki.archlinux.org/title/Archinstall#Running_the_installer),
you can give it the [config file that comes with this repository](config/archinstall/user_configuration.json).

This config file installs the Desktop / Qtile profile. It also avoids NetworkManager, opting for
`systemd-networkd` and `systemd-resolved` instead.

Once you're finished installing and you've booted into your new system, you can:

1. Copy this repository to your computer from the flash drive.
2. Set up your shell's environment (mimicking the config in [.envrc.template](.envrc.template)).
   _Don't worry, [direnv](https://direnv.net/) will be installed for you in the next step._
3. Run `make`.

If anything fails, you can fix the problem and simply run `make` again as many times as you like.

## How this works

I'm using my own Bash "target" management tool [blarg](https://github.com/pcrockett/blarg) to
automate everything. All targets are in the `targets` directory, with the entrypoint being
[`targets/main.bash`](targets/main.bash). The `blarg` tool itself is [included in this repository](bin/blarg)
so there's no need to install anything beforehand.

Targets are organized in a dependency tree, making sure the right steps are taken in the right
order, and they are never re-run unless absolutely necessary. This means you can execute all these
targets however often you want, and only the necessary ones will actually be applied.
