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
            if [[ $line != "GoToFile" ]]; then
                print -s "vim $line"
            fi
        done < $zsh_hist_fname

        fc -AI
        rm -f $zsh_hist_fname

        # remove all the 'v' entries in the history
        fc -R =(history | awk '{if ($2 != "v") { gsub("^[0-9 ]*", ""); print $0 } }')
    fi
}
