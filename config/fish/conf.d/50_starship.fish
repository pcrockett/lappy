if command -v starship &>/dev/null
    set --export STARSHIP_CONFIG ~/.config/starship/starship.toml
    starship init fish | source
end
