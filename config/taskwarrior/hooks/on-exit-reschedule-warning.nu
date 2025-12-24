#!/usr/bin/env -S nu --stdin

const COMMANDS_TO_WARN = [
  command:agenda
  command:schedule
  command:scheduled
  command:today
]

def main [...args: string] {

  if ($args | any {|a| $a in $COMMANDS_TO_WARN }) {
    let overdue_count = get-overdue-count
    if ($overdue_count > 0) {
      $"WARNING: ($overdue_count) tasks overdue. Run `task reschedule` for details." | print
    }
  }

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Overdue hook has only been tested with hooks API v2" | print
  }

  ignore
}

def get-overdue-count [] {
  # each of these filters will be effectively joined by an `and`
  let filters = [
    '(status:pending or status:waiting)'
    '((+SCHEDULED schedule.before:today) or (due.before:today))'
    '-PARENT'
  ] | str join ' '

  ^task $filters count | complete | match $in {
    {exit_code: 0} => { $in.stdout | into int }
    _ => {
      error make {
        msg: $"The command `task ($filters) count` exited with code ($in.exit_code):\n\n($in | table)"
      }
    }
  }
}
