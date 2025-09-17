#!/usr/bin/env blarg

depends_on asdf/default-tools-installed

satisfied_if() {
  command -v shellcheck && shellcheck --version
}
