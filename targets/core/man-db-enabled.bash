#!/usr/bin/env blarg

depends_on man-installed

satisfied_if() {
    test "$(systemctl is-enabled man-db.timer)" == "enabled"
}

apply() {
    sudo systemctl enable --now man-db.timer
}
