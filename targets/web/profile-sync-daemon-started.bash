#!/usr/bin/env blarg

UNIT="psd.service"

depends_on profile-sync-daemon-configured librewolf-installed

satisfied_if() {
    test "$(systemctl --user is-enabled "${UNIT}")" == "enabled" &&
        test "$(systemctl --user is-active "${UNIT}")" == "active"
}

apply() {
    systemctl --user enable --now "${UNIT}"
}
