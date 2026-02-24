#!/usr/bin/env -S nu --stdin

def main [...args: string] {
  let tasks = ($in | lines | each { from json })
  let original_task = $tasks.0
  let modified_task = $tasks.1

  # - if newly scheduled date is later / larger than original date, increment
  #   `resched_count` UDA
  # - if `resched_count` UDA is larger than 3, print warning

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Reschedule modify hook has only been tested with hooks API v2" | print
  }

  ignore
}
