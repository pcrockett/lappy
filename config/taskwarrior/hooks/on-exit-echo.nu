#!/usr/bin/env -S nu --stdin

def main [...args: string] {
  let tasks = ($in | lines | each { from json })

  if ($env | get --optional TASKWARRIOR_ECHO | is-not-empty) {
    (
      $"
script args:
($args | table)

tasks:
($tasks | table --expand)
" | print
    )
  }

  ignore
}
