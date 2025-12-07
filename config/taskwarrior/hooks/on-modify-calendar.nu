#!/usr/bin/env -S nu --stdin
#
# <https://kagi.com/assistant/ad855b45-3b9e-4bc5-87b3-0d247376b7a4>
#

use ical

# only update the calendar if any of these fields have changed
const IMPORTANT_FIELDS = [
  calendaruid
  description
  scheduled
  duration
]

def main [...args: string] {
  let tasks = ($in | lines | each { from json })
  let original_task = $tasks.0
  let modified_task = $tasks.1
  let calendar_uid: string = $modified_task | get --optional calendaruid
  let scheduled_timestamp: string = $modified_task | get --optional scheduled

  # see if we need to remove this from the calendar
  if ($scheduled_timestamp | is-empty) or ($modified_task | get --optional status) in [deleted completed] {
    if ($calendar_uid | is-not-empty) {
      rm --force (ical event-path $calendar_uid)
      $"Removed from calendar." | print
    }
    ($modified_task | to json --raw | print)
    return
  }

  let output_task = if ($calendar_uid | is-empty) {
    $modified_task
    | upsert calendaruid (random uuid)
    | upsert calendarseq "0"
  } else {
    let old_seq = $modified_task.calendarseq | default "0" | into int
    (
      $modified_task
      | upsert calendarseq ($old_seq + 1 | into string)
    )
  }

  let needs_update = (
    $IMPORTANT_FIELDS
    | any {|field|
      let orig = $original_task | get --optional $field
      let output = $output_task | get --optional $field
      $orig != $output
    }
  )

  if not $needs_update {
    ($modified_task | to json --raw | print)
    return
  }

  let temp_calendar_uid = $output_task.calendaruid
  let ics_path = ical event-path $temp_calendar_uid
  let scheduled_time_utc = $scheduled_timestamp | into datetime | date to-timezone UTC
  let now_utc = date now | date to-timezone UTC
  let duration = $output_task | get --optional duration | default --empty "30min" | into duration

  # khal doesn't seem to recognize changes without recreating the file
  rm --force $ics_path

  (
    ical render {
      uuid: $output_task.calendaruid
      description: $output_task.description
      scheduled: $scheduled_time_utc
      modified: $now_utc
      duration: $duration
      sequence: $output_task.calendarseq
    }
    | save --force $ics_path
  )
  ($output_task | to json --raw | print)
  "Updated calendar" | print

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Calendar modify hook has only been tested with hooks API v2" | print
  }

  ignore
}
