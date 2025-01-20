#!/usr/bin/env blarg

targets=(
    archivebox-installed
    podcast-archiver-installed
    podcast-archiver-configured
)

depends_on "${targets[@]}"
