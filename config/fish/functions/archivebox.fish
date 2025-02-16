function archivebox
    set docker_cmd docker run \
        --rm --interactive \
        --publish 127.0.0.1:8000:8000 \
        --volume "$HOME/.local/state/archivebox:/data" \
        --workdir /data

    if test -t 0
        set --append docker_cmd --tty
    end

    set --append docker_cmd docker.io/archivebox/archivebox:latest $argv

    echo $docker_cmd
end
