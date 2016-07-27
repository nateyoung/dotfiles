# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

PS1="\[\e[1;32m\][\u@\h \w] # \[\e[0m\]"

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# some more ls aliases

if [ -f ~/git/dotfiles/.bash_aliases ]; then
    . ~/git/dotfiles/.bash_aliases
fi

# set up android sdk
if [ -d /home/nate/android/android-studio/bin ]; then
  export PATH=/home/nate/android/android-studio/bin:$PATH
fi

export IGNOREEOF=5 # shell only exits after the 5th consecutive Ctrl-d

export EDITOR='vim'

alias vimplugs='mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
mkdir vimplugs_temp && \
cd vimplugs_temp && \
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
(tar c .) | (cd ~/.vim/bundle && tar xf -) && \
cd .. && \
rm -rf vimplugs_temp'
