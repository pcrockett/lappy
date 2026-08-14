#!/usr/bin/env blarg
#
# in qtile 0.37.0 a regression was shipped that requires this fix. github issue:
#
#     <https://github.com/qtile/qtile/issues/6023>
#
# eventually when this is fixed, released, and packaged, this target will no longer
# be necessary.

DESKTOP_FILE="/usr/share/xsessions/qtile.desktop"
SYSTEM_SCRIPT_PATH="/usr/local/bin/qtile-start"
REPO_SCRIPT_PATH="${BLARG_MODULE_DIR}/config/qtile/qtile-start"
BAD_LINE_START='Exec=/bin/sh -c "systemctl --user'
FIX_LINE="Exec=${SYSTEM_SCRIPT_PATH}"

satisfied_if() {
  command -v qtile-start &>/dev/null \
    && ! grep --fixed-strings "${BAD_LINE_START}" "${DESKTOP_FILE}" \
    && files_are_same "${SYSTEM_SCRIPT_PATH}" "${REPO_SCRIPT_PATH}"
}

apply() {
  as_root install --mode u=rwx,g=rx,o=rx "${REPO_SCRIPT_PATH}" "${SYSTEM_SCRIPT_PATH}"
  as_root sed --in-place "s|^Exec=.*|${FIX_LINE}|" "${DESKTOP_FILE}"
}
