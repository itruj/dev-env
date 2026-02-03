#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if command -v eza &> /dev/null; then
  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='ls -a'
  alias lt='eza --tree --level=2 --long --icons --git'
  alias lta='lt -a'
fi

alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '

if command -v starship &> /dev/null; then
  eval "$(starship init bash)"
fi

if command -v fzf &> /dev/null; then
  eval "$(fzf --bash)"
fi

if command -v mise &> /dev/null; then
  eval "$(mise activate bash)"
fi
