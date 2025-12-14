#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on docker-service-enabled added-to-docker-group

PACKAGES=(
  distrobox
)

snippet "packages-installed"
