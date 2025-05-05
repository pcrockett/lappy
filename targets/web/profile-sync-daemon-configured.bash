#!/usr/bin/env blarg

depends_on profile-sync-daemon-installed core/with-umask-installed

BROWSERS_DIR="/usr/share/psd/browsers"
FIREFOX_CONFIG="${BROWSERS_DIR}/firefox"
LIBREWOLF_CONFIG="${BROWSERS_DIR}/librewolf"
REPO_PSD_CONF="${BLARG_CWD}/config/profile-sync-daemon"
USER_PSD_CONF="${HOME}/.config/psd"

satisfied_if() {
    test -f "${LIBREWOLF_CONFIG}" \
        && test "$(file_timestamp "${FIREFOX_CONFIG}")" -lt "$(file_timestamp "${LIBREWOLF_CONFIG}")" \
        && test_symlink "${REPO_PSD_CONF}" "${USER_PSD_CONF}"
}

apply() {
    sed 's|\.mozilla/firefox|.librewolf|g' "${FIREFOX_CONFIG}" \
        | as_root with-umask u=rwx,g=r,o=r dd of="${LIBREWOLF_CONFIG}" status=none

    rm -rf "${USER_PSD_CONF}"
    ln --symbolic "${REPO_PSD_CONF}" "${USER_PSD_CONF}"

    if [ "$(systemctl --user is-active psd.service)" == "active" ]; then
        systemctl --user restart psd.service
    fi
}
