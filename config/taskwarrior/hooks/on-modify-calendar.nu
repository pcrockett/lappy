#!/usr/bin/env -S nu --stdin
#
# <https://kagi.com/assistant/ad855b45-3b9e-4bc5-87b3-0d247376b7a4>
#

use ical

def main [...args: string] {
  let tasks = ($in | lines | each { from json })
  let task = {
    original: $tasks.0
    modified: $tasks.1
  }

  let calendar_uid = {
    original: ($task.original | get --optional calendaruid)
    modified: ($task.modified | get --optional calendaruid)
  }

  if ($calendar_uid.original | is-not-empty) {
    rm --force (ical event-path $calendar_uid.original)
  }

  let scheduled_timestamp: string = $task.modified | get --optional scheduled
  if ($scheduled_timestamp | is-empty) or ($task.modified | get --optional status) in [deleted completed] {
    # no way to put this on the calendar.
    if ($calendar_uid.modified | is-not-empty) {
      rm --force (ical event-path $calendar_uid.modified)
      "removed from calendar" | print
    }
    ($task.modified | to json --raw | print)
    return
  }

  let output_task = if ($calendar_uid.modified | is-empty) {
    $task.modified
    | upsert calendaruid (random uuid)
    | upsert calendarseq "0"
  } else {
    let old_seq = $task.modified.calendarseq | default "0" | into int
    (
      $task.modified
      | upsert calendarseq ($old_seq + 1 | into string)
    )
  }

  let calendar_uid = $calendar_uid | insert output $output_task.calendaruid
  let ics_path = ical event-path $calendar_uid.output
  let scheduled_time_utc = $scheduled_timestamp | into datetime | date to-timezone UTC
  let now_utc = date now | date to-timezone UTC

  (
    ical render
      --uuid $output_task.calendaruid
      --description $output_task.description
      --scheduled $scheduled_time_utc
      --modified $now_utc
      --duration 10min
    | save --force $ics_path
  )
  ($output_task | to json --raw | print)

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Calendar modify hook has only been tested with hooks API v2" | print
  }

  ignore
}
