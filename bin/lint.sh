#!/usr/bin/env bash
set -Eeuo pipefail

EXIT_STATUS=0

report_lint() {
    EXIT_STATUS=1
    echo "lint: ${*}"
}

all_files() {
    rg --files
}

ignore() {
    # expects stdin to be a newline-delimited list
    # filters out any lines that match the parameters given
    # parameters should be regular expressions
    #
    # ex:
    #
    #     ignore foo <<EOF
    #     hello
    #     foo
    #     bar
    #     EOF
    #
    # outputs:
    #
    #     hello
    #     bar
    #
    command=(rg --invert-match --line-regexp)
    for f in "${@}"; do
        command+=(-e "${f}")
    done
    "${command[@]}"
}

append() {
    cat
    for i in "${@}"; do
        echo "${i}"
    done
}

rule:shellcheck() {
    local special_scripts=(
        bin/newtarget
        config/bash/bashrc
        config/direnv/direnvrc
    )
    all_files \
        | rg '\.(sh|bash)$' \
        | append "${special_scripts[@]}" \
        | xargs shellcheck
}

rule:no_raw_sudo() {
    ! all_files \
        | ignore "bin/lint\.sh" "lib\.d/50_as_root\.sh" \
        | xargs rg --word-regexp --fixed-strings "sudo"
}

rule:no_core_main() {
    ! all_files \
        | ignore "bin/lint\.sh" "targets/main.bash" \
        | xargs rg --word-regexp --fixed-strings 'core/main'
}

main() {
    rule:shellcheck || report_lint "shellcheck failed"
    rule:no_raw_sudo || report_lint "don't use raw \`sudo\` -- use \`as_root\` instead."
    rule:no_core_main || report_lint "don't depend on core/main."

    if [ "${EXIT_STATUS}" -eq 0 ]; then
        echo "no lint found"
    fi
    exit "${EXIT_STATUS}"
}

main "${@}"
