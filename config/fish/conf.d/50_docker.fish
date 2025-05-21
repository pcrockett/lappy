set --global --export BUILDKIT_PROGRESS plain

function doc -d "Docker compose alias"
    docker compose $argv
end

function docup -d "docker compose up --build --wait"
    doc up --build --wait $argv
end

function docdown -d "docker compose down"
    doc down $argv
end
