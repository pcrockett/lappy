function bwu --description "Unlock your Bitwarden vault"
    set --export --global BW_SESSION (bw unlock --raw)
end
