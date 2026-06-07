#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on tp-smapi-installed

PACKAGES=(
  tlp
)

snippet "packages-installed"
