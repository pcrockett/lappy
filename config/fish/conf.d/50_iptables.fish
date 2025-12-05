abbr --add iptl --position command \
    "sudo iptables --list --verbose --numeric --line-numbers"

abbr --add iptd --position command \
    "sudo iptables --delete INPUT 1"
