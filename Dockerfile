FROM docker.io/library/archlinux:base AS base
RUN pacman -Syu --noconfirm --verbose git pre-commit gitleaks shellcheck actionlint shfmt ripgrep

FROM base AS my-tools
RUN --mount=type=secret,id=GITHUB_TOKEN,env=GITHUB_TOKEN \
curl -SsfL https://philcrockett.com/yolo/v1.sh \
    | bash -s -- tagref yamlfmt

FROM base
COPY --from=my-tools /usr/local/bin/tagref /usr/local/bin/tagref
COPY --from=my-tools /usr/local/bin/yamlfmt /usr/local/bin/yamlfmt
RUN useradd --create-home user && \
mkdir /repo && \
chown -R user:user /repo
USER user
WORKDIR /repo
COPY --chown=user:user .pre-commit-config.yaml /repo/
RUN \
git config --global init.defaultBranch main && \
git init . && \
pre-commit install --install-hooks
COPY --chown=user:user . /repo/
RUN git add .  # tell pre-commit what files to lint
