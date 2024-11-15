#!/usr/bin/env blarg

depends_on docker-installed

satisfied_if() {
    groups | grep --word-regexp "docker"
}

apply() {
    as_root usermod --append --groups docker "${USER}"
    if [ "$(systemctl is-active docker.service)" == "active" ]; then
        as_root systemctl restart docker.service
    fi
    echo "User added to \`docker\` group. Log out and in for settings to take effect."
}
