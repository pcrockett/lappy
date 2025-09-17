#!/usr/bin/env blarg

depends_on brscan4-installed

NAME=Scanner_DCP7055W
MODEL=DCP7055W
GREP_OUTPUT="$(
  cat <<EOF
${MODEL}
${SCANNER_IP_ADDRESS}
${NAME}
EOF
)"

satisfied_if() {
  scanner_info="$(
    brsaneconfig4 -q \
      | grep --fixed-strings --only-matching -e "${MODEL}" -e "${NAME}" -e "${SCANNER_IP_ADDRESS}"
  )"
  test "${scanner_info}" = "${GREP_OUTPUT}"
}

apply() {
  as_root brsaneconfig4 -a "name=${NAME}" "model=${MODEL}" "ip=${SCANNER_IP_ADDRESS}"
}
