PROMPT='%n@%m %~ $ ';
check_exec 'rps1.zsh' && function precmd() {
    RPROMPT=`rps1.zsh`
}

