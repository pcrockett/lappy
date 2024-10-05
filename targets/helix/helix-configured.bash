#!/usr/bin/env blarg

LOCAL_CONFIG="${BLARG_CWD}/config/helix"
HELIX_CONFIG=~/.config/helix

reached_if() {
    test_symlink "${LOCAL_CONFIG}" "${HELIX_CONFIG}"
}

apply() {
    rm -rf "${HELIX_CONFIG}"
    ln --symbolic "${LOCAL_CONFIG}" "${HELIX_CONFIG}"
    test -f "${LOCAL_CONFIG}/config.toml" \
        || cp -H "${LOCAL_CONFIG}/config.dark.toml" "${LOCAL_CONFIG}/config.toml"
}
