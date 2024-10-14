# lappy

My "tinkering" laptop config.

## Getting started

This repo configures a Linux system after a fresh install of Arch (btw).

_The following is based on vague memories -- next time I'll save the installer config file._

When [running the Arch installer](https://wiki.archlinux.org/title/Archinstall#Running_the_installer),
choose the Desktop / Qtile profile. Also avoid NetworkManager, opting for `systemd-networkd` and
`systemd-resolved` instead.

Once you've booted into your new system, you can:

1. Get this repo onto your new system (probably via USB drive since networking isn't set up yet).
2. Set up your shell's environment (mimicking the config in [.envrc.template](.envrc.template)).
   _Don't worry, [direnv](https://direnv.net/) will be installed for you in the next step._
3. Run `make`

If anything fails, you can fix the problem and simply run `make` again as many times as you like.

## How this works

I'm using my own Bash "target" management tool [blarg](https://github.com/pcrockett/blarg) to
automate everything. All targets are in the `targets` directory, with the entrypoint being
[`targets/main.bash`](targets/main.bash).

Targets are organized in a dependency tree, making sure the right steps are taken in the right
order, and they are never re-run unless absolutely necessary. This means you can execute all these
targets however often you want, and only the necessary ones will actually be applied.
