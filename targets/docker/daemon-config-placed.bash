#!/usr/bin/env blarg

depends_on core/with-umask-installed

REPO_CONFIG_DIR="${BLARG_CWD}/config/docker"
SYSTEM_CONFIG_DIR="/etc/docker"

satisfied_if() {
    if [ "${DOCKER_DNS_SERVER:-}" == "" ]; then
        # docker daemon shouldn't be configured
        test ! -f "${SYSTEM_CONFIG_DIR}/daemon.json"
    else
        template_was_rendered "${REPO_CONFIG_DIR}/daemon.json.template" \
            && files_are_same "${REPO_CONFIG_DIR}/daemon.json" "${SYSTEM_CONFIG_DIR}/daemon.json"
    fi
}

apply() {
    if [ "${DOCKER_DNS_SERVER:-}" == "" ]; then
        # docker daemon shouldn't be configured
        as_root rm -f "${SYSTEM_CONFIG_DIR}/daemon.json"
    else
        template_render "${REPO_CONFIG_DIR}/daemon.json.template"
        as_root with-umask u=rwx,g=rx,o=rx mkdir --parent "${SYSTEM_CONFIG_DIR}"
        as_root with-umask u=rwx,g=r,o=r cp "${REPO_CONFIG_DIR}/daemon.json" "${SYSTEM_CONFIG_DIR}"
    fi

    if [ "$(systemctl is-active docker.service)" == "active" ]; then
        as_root systemctl restart docker.service
    fi
}
