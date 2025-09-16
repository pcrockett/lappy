#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on bat-configured

PACKAGES=(
  bat
)

snippet "packages-installed"
