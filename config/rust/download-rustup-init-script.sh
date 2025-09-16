#!/usr/bin/env bash
#
# This script is just for documentation and easily updating the rustup-init script in
# the same directory. See https://www.rust-lang.org/tools/install
#

set -Eeuo pipefail

curl_download() {
    # Copy / pasted from [ref:curl-download]
    local url="${1}"
    curl --proto '=https' --tlsv1.3 \
        --silent \
        --show-error \
        --fail \
        --location "${url}"
}

THIS_DIR="$(dirname "$(readlink -f "${0}")")"
DEST_FILE="${THIS_DIR}/rustup-init"
curl_download https://sh.rustup.rs >"${DEST_FILE}"
chmod +x "${DEST_FILE}"
