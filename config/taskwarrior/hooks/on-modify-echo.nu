#!/usr/bin/env -S nu --stdin

def main [...args: string] {
  let tasks = ($in | lines | each { from json })

  # We don't modify the task; return it unmodified as feedback
  ($tasks | last | to json --raw | print)

  if ($env | get --optional TASKWARRIOR_ECHO | is-not-empty) {
    (
      $"
script args:
($args | table)

original task:
($tasks.0 | table --expand)

modified task:
($tasks.1 | table --expand)
" | print
    )
  }

  ignore
}
