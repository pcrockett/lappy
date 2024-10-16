#!/usr/bin/env blarg

depends_on ../core/main ../git/main

reached_if() {
    test -d "${ASDF_DIR}/.git"
}

apply() {
    rm -rf "${ASDF_DIR}"
    mkdir --parent "$(dirname "${ASDF_DIR}")"
    latest_tag="$(github_latest_tag asdf-vm asdf)"
    temp_dir="$(mktemp --directory)"
    git clone https://github.com/asdf-vm/asdf.git "${temp_dir}/asdf" --branch "${latest_tag}" --depth 1
    mv "${temp_dir}/asdf" "${ASDF_DIR}"
    rmdir "${temp_dir}"
}
