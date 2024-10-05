#!/usr/bin/env blarg

LOCAL_CONFIG="${BLARG_CWD}/config/git"

reached_if() {
    test -f "${LOCAL_CONFIG}/.gitconfig" \
        && files_are_same "${LOCAL_CONFIG}/.gitconfig" "${HOME}/.gitconfig" \
        && test_symlink "${LOCAL_CONFIG}/gitignore_global" "${HOME}/.gitignore"
}

apply() {
    if [ ! -f "${HOME}/.gitconfig" ]; then
        PUBLIC_NAME="${PUBLIC_NAME}" \
        PUBLIC_EMAIL="${PUBLIC_EMAIL}" \
            envsubst \
            < "${LOCAL_CONFIG}/gitconfig.template" \
            > "${LOCAL_CONFIG}/.gitconfig"
        cp "${LOCAL_CONFIG}/.gitconfig" "${HOME}/.gitconfig"
    elif ! files_are_same "${LOCAL_CONFIG}/.gitconfig" "${HOME}/.gitconfig"; then
        panic "${HOME}/.gitconfig has changed. Sync it up with ${LOCAL_CONFIG}/.gitconfig"
    fi

    rm -f "${HOME}/.gitignore"
    ln --symbolic "${LOCAL_CONFIG}/gitignore_global" "${HOME}/.gitignore"
}
