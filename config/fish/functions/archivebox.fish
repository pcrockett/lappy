function archivebox
    docker run --rm --interactive --tty \
        --publish 127.0.0.1:8000:8000 \
        --volume "$HOME/.local/state/archivebox:/data" \
        --workdir /data \
        docker.io/archivebox/archivebox:latest \
        $argv
end
