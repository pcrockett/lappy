#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

PACKAGES=(
    gnome-keyring
    libsecret
    seahorse # not strictly required, but good for managing the keyring
)

snippet "packages-installed"
