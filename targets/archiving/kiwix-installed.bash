#!/usr/bin/env blarg

depends_on core/flatpak-installed

PACKAGE="org.kiwix.desktop"

satisfied_if() {
  flatpak info "${PACKAGE}"
}

apply() {
  flatpak install --assumeyes --noninteractive "${PACKAGE}"
}
