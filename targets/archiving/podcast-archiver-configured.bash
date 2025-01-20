#!/usr/bin/env blarg

depends_on archive/configured

REPO_PATH="${BLARG_CWD}/config/podcast-archiver"
SYSTEM_PATH=~/.config/podcast-archiver

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}" \
        && test -f "${SYSTEM_PATH}/config.yaml"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
    PODCAST_ARCHIVER_FEEDS="${PODCAST_ARCHIVER_FEEDS:-}" \
        envsubst \
        < "${REPO_PATH}/config.yaml.template" \
        > "${REPO_PATH}/config.yaml"
}
