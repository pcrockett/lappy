#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
    arch-wiki-docs  # html files in `usr/share/doc/arch-wiki/html/en/`
    mtr
    nushell
    starship
    zoxide
)

snippet "packages-installed"
