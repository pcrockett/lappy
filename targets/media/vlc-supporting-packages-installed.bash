#!/usr/bin/env blarg
# shellcheck disable=SC2034  # variables appear unused, but are used inside snippet

depends_on vlc-installed

PACKAGES=(
  ffmpeg
  gst-libav
  gst-plugins-bad
  gst-plugins-good
  gst-plugins-ugly
  vlc-plugin-gstreamer
  vlc-plugin-x264
)

snippet "packages-installed"
