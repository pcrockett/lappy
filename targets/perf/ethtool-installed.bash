#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

# allows tlp to disable wake-on-lan
PACKAGES=(
  ethtool
)

snippet "packages-installed"
