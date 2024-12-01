#!/usr/bin/env blarg

UNIT="unclutter.service"
REPO_PATH="${BLARG_CWD}/config/unclutter/${UNIT}"
SYSTEM_PATH="${HOME}/.config/systemd/user/${UNIT}"

depends_on unclutter-installed

satisfied_if() {
    files_are_same "${REPO_PATH}" "${SYSTEM_PATH}" \
        && test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" \
        && test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
    cp "${REPO_PATH}" "${SYSTEM_PATH}"
    systemctl --user daemon-reload
    systemctl --user enable --now "${UNIT}"
}
