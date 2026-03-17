#!/usr/bin/env blarg
#
# This handles the case when I try to open html files using `bgopen`.
#
# For some reason which I haven't researched yet, the `mimeapps.list` file doesn't seem
# to have an effect. Changing the mime type like this should help.

DEFAULT_APP="librewolf.desktop"
MIME_TYPE="text/html"

depends_on default-apps-configured web/librewolf-installed

satisfied_if() {
  current_default="$(xdg-mime query default "${MIME_TYPE}")"
  test "${current_default}" = "${DEFAULT_APP}"
}

apply() {
  xdg-mime default "${DEFAULT_APP}" "${MIME_TYPE}"
}
