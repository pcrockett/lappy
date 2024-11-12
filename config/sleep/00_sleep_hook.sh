#!/usr/bin/env bash

set -Eeuo pipefail

# see `man systemd-suspend.service` for details

PHASE="${1}"  # either "pre" or "post"
# ACTION="${2}"  # "suspend", "hibernate", "hybrid-sleep", or "suspend-then-hibernate"

# I'm not sure what environment this will run in. Don't rely on PATH to find your executables.
RFKILL="/usr/bin/rfkill"
AWK="/usr/bin/awk"
GREP="/usr/bin/grep"

active_bt_device_count() {
    "${RFKILL}" --output TYPE,SOFT --noheadings \
        | "${AWK}" '$1 == "bluetooth" { print $2 }' \
        | "${GREP}" --fixed-strings --count unblocked
}

on_sleep() {
    echo "sleeping..."
}

on_wake() {
    while [ "$(active_bt_device_count)" -ne 0 ];
    do
        "${RFKILL}" block bluetooth
        sleep 1
    done
}

main() {
    case "${PHASE}" in
        "pre")
            on_sleep
        ;;
        "post")
            on_wake
        ;;
        *)
            echo "unrecognized PHASE: ${PHASE}" >&2
            exit 1
        ;;
    esac
}

main
