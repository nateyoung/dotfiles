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

# mail a file
mailme() {
  swaks --from nyoung@trentonsystems.com --to nyoung@trentonsystems.com --body "file $1 is attached" --attach $1 --header "Subject: file from `hostname` - $1"
}

# function to ack edk2 sources
edk2ack() {
  ack $1 ~/git/UEFI/edk2
}
alias eack=edk2ack

alias vimplugs='mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
cd `mktemp -d` &&
git clone https://github.com/vim-airline/vim-airline.git && \
git clone https://github.com/vim-airline/vim-airline-themes.git && \
git clone https://github.com/scrooloose/nerdtree.git && \
git clone https://github.com/jeetsukumaran/vim-buffergator.git && \
git clone https://github.com/mileszs/ack.vim.git && \
git clone https://github.com/kien/ctrlp.vim.git && \
git clone https://github.com/fugalh/desert.vim.git && \
git clone git://github.com/majutsushi/tagbar && \
git clone https://github.com/godlygeek/tabular.git && \
git clone https://github.com/tomtom/tcomment_vim.git && \
git clone https://github.com/ntpeters/vim-better-whitespace.git && \
git clone https://github.com/tpope/vim-fugitive.git && \
git clone https://github.com/airblade/vim-gitgutter.git && \
git clone https://github.com/terryma/vim-multiple-cursors.git && \
git clone https://github.com/christoomey/vim-tmux-navigator.git && \
git clone https://github.com/vim-scripts/YankRing.vim.git && \
git clone https://github.com/flazz/vim-colorschemes.git && \
(tar c .) | (cd ~/.vim/bundle && tar xf -)'
