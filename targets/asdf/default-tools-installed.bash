#!/usr/bin/env blarg

depends_on default-tools-configured shellcheck-plugin-installed

satisfied_if() {
  shellcheck --version
}

apply() {
  cd ~ || panic "Unable to cd HOME?"
  asdf install || true
  shellcheck --version &>/dev/null || panic "Shellcheck didn't install correctly."
}
