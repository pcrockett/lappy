#!/usr/bin/env blarg

targets=(
    rush-installed
    rush-configured
    rush-repo-cloned
    dev/copier-installed # needed for the `newpackage` script in rush repo
)

depends_on "${targets[@]}"
