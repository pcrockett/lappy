if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -v direnv &>/dev/null
    direnv hook fish | source
end
