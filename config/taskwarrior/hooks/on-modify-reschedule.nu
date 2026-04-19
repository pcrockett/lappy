#!/usr/bin/env -S nu --stdin

# this hook should do two main things:
#
# - if newly scheduled DATE (not time) is later / larger than original date, increment
#   `postpone_count` UDA
# - if `postpone_count` UDA is larger than N, print warning

use log

const WARN_AFTER_POSTPONE_COUNT = 2

def main [...args: string] {
  let tasks = ($in | lines | each { from json })
  let original_task = $tasks.0
  let modified_task = $tasks.1

  let original = {
    date: ($original_task | scheduled-year-month-day)
    postpone_count: (
      $original_task | get --optional postpone_count | default "0" | into int
    )
  }

  if ($original.date | is-empty) {
    # nothing to do; can't reschedule a task that hasn't been scheduled yet.
    $modified_task | write-task-result
    return
  }

  let modified_date: string = $modified_task | scheduled-year-month-day
  if ($modified_date | is-empty) {
    # a task has not only been rescheduled... it has been UNscheduled.
    # i'm not sure if we should increment the postpone_count or reset it...
    # let's see what real-world usage looks like
    (
      $modified_task
      | upsert postpone_count ($original.postpone_count + 1 | into string)
      | write-task-result
    )
    return
  }

  if ($modified_date > $original.date) {
    let postpone_count = $original.postpone_count + 1
    (
      $modified_task
      | upsert postpone_count ($postpone_count | into string)
      | write-task-result
    )
    if ($postpone_count > $WARN_AFTER_POSTPONE_COUNT) {
      $"Task has been postponed ($postpone_count) times. See task scheduling antipatterns note in KB." | log warn
    }
  } else {
    # scheduled date hasn't changed, do nothing
    $modified_task | write-task-result
  }

  if ($args | where { $in == "api:2" } | is-empty) {
    "Reschedule modify hook has only been tested with hooks API v2" | log warn
  }

  ignore
}

def scheduled-year-month-day []: record -> string {
  let timestamp = $in | get --optional scheduled
  if ($timestamp | is-empty) {
    null
  } else {
    $timestamp | into datetime | date to-timezone local | format date %Y-%m-%d
  }
}

def write-task-result []: record -> nothing {
  to json --raw | print
}
