if status is-interactive
    # Commands to run in interactive sessions can go here
    if command -v direnv &>/dev/null
        direnv hook fish | source
    end
    if command -v atuin &>/dev/null
        atuin init fish --disable-up-arrow | source
    end
end
