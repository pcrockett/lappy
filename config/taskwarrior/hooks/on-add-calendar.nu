#!/usr/bin/env -S nu --stdin
#
# <https://kagi.com/assistant/ad855b45-3b9e-4bc5-87b3-0d247376b7a4>
#

use ical

def main [...args: string] {
  let task = ($in | from json)

  let scheduled_timestamp: string = $task | get --optional scheduled
  if ($scheduled_timestamp | is-empty) or ($task | get --optional status) in [deleted completed] {
    # we won't be scheduling this on a calendar
    ($task | to json --raw | print)
    return
  }

  let task = (
    $task
    | upsert calendaruid (random uuid)
    | upsert calendarseq "0"
  )

  let calendar_uid = $task.calendaruid
  let ics_path = ical event-path $calendar_uid
  let scheduled_time_utc = $scheduled_timestamp | into datetime | date to-timezone UTC
  let now_utc = date now | date to-timezone UTC
  let duration = $task | get --optional duration | default --empty "30min" | into duration

  (
    ical render {
      uuid: $calendar_uid
      description: $task.description
      scheduled: $scheduled_time_utc
      modified: $now_utc
      duration: $duration
      sequence: $task.calendarseq
    }
    | save $ics_path
  )
  ($task | to json --raw | print)

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Add calendar hook has only been tested with hooks API v2" | print
  }

  ignore
}
