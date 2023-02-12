set -o vi
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
setopt RM_STAR_SILENT
setopt AUTO_CD
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end
alias grep="grep --colour=auto"
alias ls='\ls -lvh --color'
alias l='ls'
alias lst='ls -tr'
alias lt='lst'
alias rm='\rm -vi'
alias mv='\mv -vi'
alias cp='\cp -vi'

TERM=screen-256color

precmd() {
	EXIT_STATUS=$?
	RPROMPT="%F{250}[%T]%f"

	if [ $EXIT_STATUS != 0 ]; then
		PS1=" %B%F{250}[$EXIT_STATUS]%f"$' '"%F{33}%n@%M:%d%f %F{196}->%f%b "
	else
		PS1=" %B%F{250}[$EXIT_STATUS]%f"$' '"%F{33}%n@%M:%d%f %F{119}->%f%b "
	fi
}
