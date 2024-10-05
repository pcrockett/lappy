#!/usr/bin/env blarg

targets=(
    rush-installed
    rush-configured
    rush-repo-cloned
)

depends_on "${targets[@]}"
