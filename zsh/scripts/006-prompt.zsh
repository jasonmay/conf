check_exec 'shell-prompt' && function precmd() {
    #PROMPT=`shell-prompt`
    RPROMPT=`rps1.zsh`
}

export PROMPT='%n@%m %~ $ ';
