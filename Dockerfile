FROM docker.io/library/archlinux:base AS base
RUN \
pacman -Syu --noconfirm --verbose \
  git ripgrep mise uv make

RUN useradd --create-home user && \
mkdir /repo && \
chown -R user:user /repo

# don't need to worry about non-numeric user ID quirks
# hadolint ignore=DL3066
USER user
WORKDIR /repo

COPY --chown=user:user mise.toml mise.lock /repo/
RUN mise trust && mise install

COPY --chown=user:user .pre-commit-config.yaml /repo/
RUN \
git config --global init.defaultBranch main && \
git init . && \
mise exec -- pre-commit install --install-hooks

COPY --chown=user:user . /repo/
RUN git add .  # tell pre-commit what files to lint
ENTRYPOINT [ "mise", "exec", "--" ]
