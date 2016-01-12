alias u='cd ..'
alias uu='cd ../..'
alias uuu='cd ../../..'
alias uuuu='cd ../../../..'

# determine if we're home or elsewhere (determine if we need to use duckdns)
if [[ `/sbin/iwconfig 2>&1 | grep iowireless` == 1 ]]; then
  pi_hostname='192.168.1.145'
else
  pi_hostname='nate.duckdns.org'
fi

alias sshp="ssh pi@$pi_hostname"

# ls aliases
alias ls='ls --color'
alias ll='ls -las --color'

# function to open up a port for another client on LAN
punch() {sudo iptables -I INPUT 1 -s 192.168.1.$1 -j ACCEPT}
