#!/usr/bin/env blarg

depends_on docker-installed

reached_if() {
    groups | grep --word-regexp "docker"
}

apply() {
    sudo usermod --append --groups docker "${USER}"
    if [ "$(systemctl is-active docker.service)" == "active" ]; then
        sudo systemctl restart docker.service
    fi
    echo "User added to \`docker\` group. Log out and in for settings to take effect."
}
