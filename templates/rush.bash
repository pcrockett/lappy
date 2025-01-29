#!/usr/bin/env blarg

depends_on rush/main
before_apply rush/rush-repo-pulled

PACKAGE_NAME="TODO"
panic "not implemented yet"

satisfied_if() {
    false # command -v some-bin
}

apply() {
    rush get "${PACKAGE_NAME}"
}
