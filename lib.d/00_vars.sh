# shellcheck shell=bash

if [ "${PUBLIC_EMAIL:-}" == "" ]; then
    panic "Missing \$PUBLIC_EMAIL"
fi

if [ "${PUBLIC_NAME:-}" == "" ]; then
    panic "Missing \$PUBLIC_NAME"
fi
