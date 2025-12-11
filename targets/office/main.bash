#!/usr/bin/env blarg

targets=(
  libreoffice-installed
  nextcloud-installed
  pdfarranger-installed
)

depends_on "${targets[@]}"
