check_exec 'shell-prompt' && function precmd() {
    PROMPT=`shell-prompt`
    RPROMPT=`shell-prompt right`
}

