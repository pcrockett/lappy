#!/usr/bin/env -S nu --stdin

def main [...args: string] {
  let task = ($in | from json)

  # We don't modify the task; return it unmodified as feedback
  ($task | to json --raw | print)

  # All other printed messages get output to the user
  if ($task | get --optional impact | is-empty) {
    "WARNING: Missing `impact`" | print
  }

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Impact warning script has only been tested with hooks API v2" | print
  }

  ignore
}
