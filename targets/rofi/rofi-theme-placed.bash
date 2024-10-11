#!/usr/bin/env blarg

depends_on ../hack-nerd-font-installed

THEME_DIR="${HOME}/.local/share/rofi/themes"
THEME_NAME="catppuccin-mocha"
THEME_PATH="${THEME_DIR}/${THEME_NAME}.rasi"

reached_if() {
    test -f "${THEME_PATH}"
}

apply() {
    mkdir --parent "${THEME_DIR}"
    cp "${BLARG_CWD}/config/rofi/${THEME_NAME}.rasi" "${THEME_PATH}"
}