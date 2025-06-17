function spawn -d "Run a command in the background and disown it, discarding output"
    nohup $argv &>/dev/null &
    disown
end
