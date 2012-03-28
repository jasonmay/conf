[ -e $HOME/.rvm/scripts/rvm ] && source $HOME/.rvm/scripts/rvm && rvm use -q ruby-1.9.3 > /dev/null

check_exec 'hub' && eval "$(hub alias -s)"
