#!/usr/bin/env blarg

depends_on default-tools-configured shellcheck-plugin-installed shfmt-plugin-installed

satisfied_if() {
  shellcheck --version && shfmt --version
}

apply() {
  cd ~ || panic "Unable to cd HOME?"
  asdf install || true
  shellcheck --version &>/dev/null || panic "shellcheck didn't install correctly."
  shfmt --version &>/dev/null || panic "shfmt didn't install correctly."
}
