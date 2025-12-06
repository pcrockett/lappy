#!/usr/bin/env blarg
#
# <https://software.opensuse.org/download.html?project=home%3Adg0yt&package=openorienteering-mapper>
#

# shellcheck disable=SC2016  # yes, i know `$` doesn't expand in single quotes
REPO_SETTING='
[home_dg0yt_Arch_Community]
SigLevel = Required TrustAll
Server = https://download.opensuse.org/repositories/home:/dg0yt/Arch_Community/$arch
'

KEY_FINGERPRINT='5D2123C57FA7BDCC60B77A67CD7B217B7CE0AE6A'

satisfied_if() {
  grep --fixed-strings '[home_dg0yt_Arch_Community]' /etc/pacman.conf
}

apply() {
  as_root pacman-key --init
  as_root pacman-key --add - <"${BLARG_CWD}/config/openorienteering/openorienteering.key"
  as_root pacman-key --lsign-key "${KEY_FINGERPRINT}"
  echo "${REPO_SETTING}" | as_root tee --append /etc/pacman.conf
}
