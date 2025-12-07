const TIMEZONE = {
  # TODO: get this dynamically from local tzdata
  id: "Europe/Berlin"
  standard: {
    name: CET
    begin: "20251026T020000"
    offset_before: "+0200"
    offset_after: "+0100"
  }
  daylight: {
    name: CEST
    begin:"20260329T030000"
    offset_before: "+0100"
    offset_after: "+0200"
  }
}

export def render [
  spec: record<
    uuid: string
    description: string
    scheduled: datetime
    modified: datetime
    duration: duration
    sequence: string
  >
] {

  let scheduled_timestamp_local = (
    $spec.scheduled
    | date to-timezone local
    | format date "%Y%m%dT%H%M%S"
  )

  let end_time = $spec.scheduled + $spec.duration
  let end_timestamp_local = (
    $end_time
    | date to-timezone local
    | format date "%Y%m%dT%H%M%S"
  )

  let modified_timestamp_utc = (
    $spec.modified
    | date to-timezone UTC
    | format date "%Y%m%dT%H%M%SZ"
  )

  $"BEGIN:VCALENDAR

VERSION:2.0
PRODID:-//philcrockett.com//lappy-taskwarrior-ical-integraion 0.1//EN

BEGIN:VTIMEZONE
TZID:($TIMEZONE.id)
BEGIN:STANDARD
DTSTART:($TIMEZONE.standard.begin)
TZNAME:($TIMEZONE.standard.name)
TZOFFSETFROM:($TIMEZONE.standard.offset_before)
TZOFFSETTO:($TIMEZONE.standard.offset_after)
END:STANDARD
BEGIN:DAYLIGHT
DTSTART:($TIMEZONE.daylight.begin)
TZNAME:($TIMEZONE.daylight.name)
TZOFFSETFROM:($TIMEZONE.daylight.offset_before)
TZOFFSETTO:($TIMEZONE.daylight.offset_after)
END:DAYLIGHT
END:VTIMEZONE

BEGIN:VEVENT
SUMMARY:($spec.description | escape-text)
DTSTART;TZID=($TIMEZONE.id):($scheduled_timestamp_local)
DTEND;TZID=($TIMEZONE.id):($end_timestamp_local)
DTSTAMP:($modified_timestamp_utc)
UID:($spec.uuid)
SEQUENCE:($spec.sequence)
BEGIN:VALARM
ACTION:DISPLAY
TRIGGER:-PT10M
DESCRIPTION:($spec.description | escape-text)
END:VALARM
END:VEVENT

END:VCALENDAR
"
}

export def event-path [calendar_uid: string]: nothing -> string {
  calendar-dir | path join $"($calendar_uid).ics"
}

def calendar-dir []: nothing -> string {
  # TODO: XDG standard
  $env.HOME | path join ".local/share/lappy-pim/calendar/taskwarrior"
}

def escape-text []: string -> string {
  $in
  | str replace --all '\' '\\'
  | str replace --all ';' '\;'
  | str replace --all ',' '\,'
  | str replace --all "\n" '\n'
}
