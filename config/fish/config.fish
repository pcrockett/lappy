if status is-interactive
    # Commands to run in interactive sessions can go here
end

if command -v direnv &>/dev/null
    direnv hook fish | source
end

if [ -d $ASDF_DIR ]
    source "$ASDF_DIR/asdf.fish"
end
