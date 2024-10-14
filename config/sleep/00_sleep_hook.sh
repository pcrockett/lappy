#!/usr/bin/env bash

set -Eeuo pipefail

# see `man systemd-suspend.service` for details

PHASE="${1}"  # either "pre" or "post"
# ACTION="${2}"  # "suspend", "hibernate", "hybrid-sleep", or "suspend-then-hibernate"

on_sleep() {
    echo "sleeping..."
}

on_wake() {
    /usr/bin/rfkill block bluetooth
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
