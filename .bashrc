#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias l='ls -lvh --color=auto'
alias ls='ls -lvh --color=auto'
PS1='[\u@\h \W]\$ '
shopt -s autocd
