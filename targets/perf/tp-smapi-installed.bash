#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet
#
# thinkpad-specific drivers for things like battery charging thresholds
#
# - <https://github.com/linux-thinkpad/tp_smapi>
# - <https://wiki.archlinux.org/title/Tp_smapi>
# - <https://www.thinkwiki.org/wiki/Tp_smapi#Model-specific_status>
#
# install both flavors to enable switching kernels more seamlessly

PACKAGES=(
  tp_smapi
  tp_smapi-lts
)

snippet "packages-installed"
