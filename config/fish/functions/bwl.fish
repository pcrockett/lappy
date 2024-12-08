function bwl --description "Lock your Bitwarden vault"
    bw lock
    set --erase BW_SESSION
end
