export def warn []: string -> nothing {
  $"(ansi yellow_reverse)(ansi attr_bold)WARNING:(ansi reset_bold) ($in)(ansi reset)" | print
}
