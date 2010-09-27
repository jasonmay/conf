
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _approximate _prefix
zstyle ':completion:*' list-prompt '[%p] %l'
zstyle ':completion:*' matcher-list 'r:|[_-/]=** r:|=**'
zstyle ':completion:*' max-errors 1
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle :compinstall filename "$HOME/.zshcomplete"

autoload -Uz compinit
compinit
# End of lines added by compinstall
