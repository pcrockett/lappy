#!/usr/bin/env blarg

depends_on \
  cups-socket-enabled \
  cups-service-started \
  brother-driver-installed \
  network/hosts-configured

PRINTER_NAME="Printer_DCP7055W"

satisfied_if() {
  lpstat -p | grep --fixed-strings --word-regexp "${PRINTER_NAME}"
}

apply() {
  as_root lpadmin \
    -p "${PRINTER_NAME}" \
    -E \
    -v "ipp://printer.home/ipp" \
    -m "drv:///brlaser.drv/br7055w.ppd"
}
