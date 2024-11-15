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

rule:no_raw_sudo() {
    ! all_files \
        | ignore "bin/custom_lint\.sh" "lib\.d/50_as_root\.sh" \
        | xargs rg --word-regexp --fixed-strings "sudo"
}

main() {
    rule:no_raw_sudo || report_lint "don't use raw \`sudo\` -- use \`as_root\` instead."

    if [ "${EXIT_STATUS}" -eq 0 ]; then
        echo "no custom lint found"
    fi
    exit "${EXIT_STATUS}"
}

main "${@}"
