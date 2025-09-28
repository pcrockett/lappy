#!/usr/bin/env blarg

depends_on brscan4-installed network/hosts-configured

NAME=Scanner_DCP7055W
MODEL=DCP7055W
SCANNER_HOST=scanner.home
GREP_OUTPUT="$(
  cat <<EOF
${MODEL}
${SCANNER_HOST}
${NAME}
EOF
)"

satisfied_if() {
  scanner_info="$(
    brsaneconfig4 -q \
      | grep --fixed-strings --only-matching -e "${MODEL}" -e "${NAME}" -e "${SCANNER_HOST}"
  )"
  test "${scanner_info}" = "${GREP_OUTPUT}"
}

apply() {
  as_root brsaneconfig4 -a "name=${NAME}" "model=${MODEL}" "nodename=${SCANNER_HOST}"
}
