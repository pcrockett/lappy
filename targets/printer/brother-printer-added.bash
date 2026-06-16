#!/usr/bin/env blarg

depends_on \
  cups-socket-enabled \
  brother-driver-installed \
  network/hosts-configured

PRINTER_NAME="Printer_DCP7055W"

satisfied_if() {
  test -f "/etc/cups/ppd/${PRINTER_NAME}.ppd"
}

apply() {
  as_root lpadmin \
    -p "${PRINTER_NAME}" \
    -E \
    -v "ipp://printer.home/ipp" \
    -m "drv:///brlaser.drv/br7055w.ppd"
}
