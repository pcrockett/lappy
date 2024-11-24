#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on starship-configured

PACKAGES=(
    starship
)

snippet "packages-installed"
