abbr --add cpp --position command \
    "copyparty -i (tailscale ip --4 (hostnamectl hostname)) --qr"

abbr --add cpport --position command \
    "sudo iptables --insert INPUT --protocol tcp --dport 3923 --jump ACCEPT"
