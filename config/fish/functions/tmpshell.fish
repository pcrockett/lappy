function tmpshell
    set temp_dir (mktemp --directory)
    cd $temp_dir

    echo 'FROM docker.io/library/debian:trixie-slim
ARG DEBIAN_FRONTEND=noninteractive

RUN \
apt-get update && \
apt-get install --yes --no-install-recommends curl git ca-certificates extrepo && \
extrepo enable mise && \
apt-get update && \
apt-get install --yes --no-install-recommends mise && \
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
  --location https://github.com/DannyBen/rush/releases/download/v1.0.1/rush \
  >"${INSTALL_DIR}/rush" && \
echo "f1790619b2cfbf2ee73c36b61ee36c6af1d2f8ab985f7d07a4b7d7fd26456a95  ${INSTALL_DIR}/rush" \
  | sha256sum --check - && \
chmod +x "${INSTALL_DIR}/rush"
' >Dockerfile

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
