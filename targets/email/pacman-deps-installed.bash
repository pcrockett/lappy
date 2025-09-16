#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on core/w3m-installed

PACKAGES=(
    aerc
    dante # for html emails
)

snippet "packages-installed"
