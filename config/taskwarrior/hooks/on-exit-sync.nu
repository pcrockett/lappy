#!/usr/bin/env -S nu --stdin

def main [...args: string] {

  if ($args | any { $in == "command:synchronize" }) {
    "Syncing calendar..." | print
    let result = ^vdirsyncer sync taskwarrior | complete
    match $result {
      {exit_code: 0} => { "Calendar sync successful." | print }
      {exit_code: $x} => {
        error make {
          msg: $"ERROR: Command `vdirsyncer sync taskwarrior` exited with code ($x)"
        }
      }
    }
  }

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Calendar exit hook has only been tested with hooks API v2" | print
  }

  ignore
}
