function tmpshell
    set temp_dir (mktemp --directory)
    cd $temp_dir

    echo 'FROM docker.io/library/debian:trixie-slim

RUN \
apt-get update && \
apt-get install --yes --no-install-recommends curl git ca-certificates && \
useradd --create-home user

USER user

ARG INSTALL_DIR=/home/user/.local/bin
ENV PATH="${INSTALL_DIR}:${PATH}"

RUN \
mkdir --parent "${INSTALL_DIR}" && \
curl --proto \'=https\' --tlsv1.3 \
  --silent \
  --show-error \
  --fail \
  --location https://github.com/DannyBen/rush/releases/download/v1.0.0/rush \
  >"${INSTALL_DIR}/rush" && \
chmod +x "${INSTALL_DIR}/rush"' >Dockerfile

    echo '[private]
_default:
    @just --list

# Build temp container and run /bin/bash inside it
run:
    docker build --tag temp .
    docker run --rm -it temp /bin/bash
' >justfile

    echo "Run `exit` when finished"
    fish
    cd -
    rm -rf $temp_dir
    echo "Cleaned up $temp_dir"
end
