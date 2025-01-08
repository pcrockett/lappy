#!/usr/bin/env blarg

depends_on docker/main

DATA_DIR="${HOME}/.local/state/archivebox"
DOCKER_IMAGE="docker.io/archivebox/archivebox:latest"

satisfied_if() {
    test -d "${DATA_DIR}" \
        && docker image inspect "${DOCKER_IMAGE}"
}

apply() {
    mkdir --parent "${DATA_DIR}"
    docker image pull "${DOCKER_IMAGE}"
}
