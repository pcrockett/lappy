FROM docker.io/library/archlinux:base AS base
RUN pacman -Syu --noconfirm --verbose git pre-commit gitleaks shellcheck actionlint shfmt ripgrep

FROM base AS my-tools
RUN curl -SsfL https://philcrockett.com/yolo/v1.sh \
    | bash -s -- tagref

FROM base
COPY --from=my-tools /usr/local/bin/tagref /usr/local/bin/tagref
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
