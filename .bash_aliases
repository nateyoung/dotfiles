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
#punch() {sudo iptables -I INPUT 1 -s 192.168.1.$1 -j ACCEPT}

# adb aliases
alias adev='adb devices'
alias acon='adb connect 192.168.1.111:5555'

# tmuxinator
alias tdev='tmuxinator start dev'
alias twatch='tmuxinator start watchdog'
alias tmisc='tmuxinator start misc'
alias tedk='tmuxinator start edk'
alias tmuxl='tmux list-sessions'
alias tmuxa='tmux attach'
alias tmuxk='tmux kill-session -t'

alias un='sudo umount /media/nyoung/NATE/'

# function to ack edk2 sources
edk2ack() {
  ack $1 ~/git/UEFI/edk2
}
alias eack=edk2ack
