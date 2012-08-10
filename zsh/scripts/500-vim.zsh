function vim {
    local zsh_hist_fname
    zsh_hist_fname=$HOME/.vim/hist$$
    command vim --cmd "let g:_zsh_hist_fname = '$zsh_hist_fname'" "$@"
    if [[ -r $zsh_hist_fname ]]; then
        while read line; do
            if echo $line | grep -q "[[:space:]']"; then
                line=${line/\'/\'\\\\\'\'}
                line="'$line'"
            fi
            print -s "vim $line"
        done < $zsh_hist_fname
        fc -AI
        rm -f $zsh_hist_fname
    fi
}
