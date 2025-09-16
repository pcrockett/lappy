#!/usr/bin/env blarg

depends_on archive/configured

REPO_PATH="${BLARG_CWD}/config/podcast-archiver"
SYSTEM_PATH=~/.config/podcast-archiver

satisfied_if() {
    test_symlink "${REPO_PATH}" "${SYSTEM_PATH}" &&
        template_was_rendered "${REPO_PATH}/config.yaml.template"
}

apply() {
    rm -rf "${SYSTEM_PATH}"
    ln --symbolic "${REPO_PATH}" "${SYSTEM_PATH}"
    PODCAST_FEEDS="${PODCAST_FEEDS:-}" \
        template_render "${REPO_PATH}/config.yaml.template"
}
