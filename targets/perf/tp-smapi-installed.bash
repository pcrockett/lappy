#!/usr/bin/env blarg
#
# thinkpad-specific drivers for things like battery charging thresholds
#
# - <https://github.com/linux-thinkpad/tp_smapi>
# - <https://wiki.archlinux.org/title/Tp_smapi>
# - <https://www.thinkwiki.org/wiki/Tp_smapi#Model-specific_status>

# shellcheck disable=SC2034  # PACKAGES used in aur snippet
PACKAGES=(
  tp_smapi-dkms
)

snippet aur
