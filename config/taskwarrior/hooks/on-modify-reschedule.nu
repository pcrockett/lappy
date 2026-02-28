#!/usr/bin/env -S nu --stdin

# this hook should do two main things:
#
# - if newly scheduled DATE (not time) is later / larger than original date, increment
#   `resched_count` UDA
# - if `resched_count` UDA is larger than 3, print warning

def main [...args: string] {
  let tasks = ($in | lines | each { from json })
  let original_task = $tasks.0
  let modified_task = $tasks.1

  let original_time_local: datetime = $original_task | scheduled-time-local
  let resched_count = $original_task | get --optional resched_count | default 0

  if ($original_time_local | is-empty) and ($resched_count == 0) {
    # nothing to do
    $modified_task | to json --raw | print
    return
  }

  let modified_time_local: datetime = $modified_task | scheduled-time-local
  if ($modified_time_local | is-empty) {
    # i'm not sure if we should increment the resched_count or reset it...
    # let's see what real-world usage looks like
    $modified_task | upsert resched_count ($resched_count + 1) | to json --raw | print
    return
  }

  # TODO: increment logic
  # TODO: check resched_count, issue warning

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Reschedule modify hook has only been tested with hooks API v2" | print
  }

  ignore
}

def scheduled-time-local []: record -> datetime {
  let timestamp = $in | get --optional scheduled
  if ($timestamp | is-empty) {
    null
  } else {
    $timestamp | into datetime
  }
}
