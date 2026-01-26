#!/usr/bin/env -S nu --stdin

def main [...args: string] {

  if ($args | any { $in == "command:synchronize" }) {
    # TODO: move to `tw` wrapper <https://github.com/pcrockett/rush-repo/blob/main/tw/tw>
    let task_id = enqueue vdirsyncer sync taskwarrior
    $"Enqueued pueue calendar sync task ($task_id)." | print
  }

  if ($args | where { $in == "api:2" } | is-empty) {
    "WARNING: Calendar exit hook has only been tested with hooks API v2" | print
  }

  ignore
}

def enqueue [...args: string]: nothing -> int {
  let enqueue_result = ^pueue add --print-task-id -- ...$args | complete
  match $enqueue_result {
    {exit_code: 0, stdout: $stdout} => { ($stdout | into int) }
    {exit_code: $x} => {
      error make {
        msg: $"ERROR: Unable to enqueue task `($args | str join ' ')`: pueue exited with code ($x)"
      }
    }
  }
}
