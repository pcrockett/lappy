#!/usr/bin/env blarg

depends_on rush-configured

satisfied_if() {
    command -v rush
}

apply() {
    local dl_url="https://raw.githubusercontent.com/DannyBen/rush-cli/master/rush"
    local dest_dir="${HOME}/.local/bin"
    local temp_file
    temp_file="$(mktemp)"
    curl_download "${dl_url}" >"${temp_file}"
    chmod +x "${temp_file}"
    mkdir --parent "${dest_dir}"
    mv "${temp_file}" "${dest_dir}/rush"
}
