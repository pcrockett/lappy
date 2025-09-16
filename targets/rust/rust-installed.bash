#!/usr/bin/env blarg

satisfied_if() {
  command -v rustc
}

apply() {
  "${BLARG_CWD}/config/rust/rustup-init" \
    --no-modify-path \
    --default-host x86_64-unknown-linux-gnu \
    --default-toolchain stable \
    -y
}
