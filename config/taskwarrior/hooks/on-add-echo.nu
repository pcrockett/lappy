#!/usr/bin/env -S nu --stdin

def main [...args: string] {
  let task = ($in | from json)

  # We don't modify the task; return it unmodified as feedback
  ($task | to json --raw | print)

  if ($env | get --optional TASKWARRIOR_ECHO | is-not-empty) {
    (
      $"
script args:
($args | table)

task:
($task | table --expand)
" | print
    )
  }

  ignore
}
