# shellcheck shell=bash

curl_download() {
    local url="${1}"
    curl --proto '=https' --tlsv1.2 \
        --silent \
        --show-error \
        --fail \
        --location "${url}"
}
