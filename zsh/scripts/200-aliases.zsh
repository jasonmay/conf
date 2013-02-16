function mud() {
    rlwrap telnet "$1" 6715
}

function pubkey {
    [ -e "$HOME/.ssh/id_dsa.pub" ] || ssh-keygen -t dsa
    ssh "$1" "mkdir -p .ssh; cat - >> .ssh/authorized_keys; chmod -R g-rwx,o-rwx .ssh" \
        < "$HOME/.ssh/id_dsa.pub"
}

alias grep='grep --color=auto'

alias netstat_useful="netstat -a --inet --numeric-port"

alias grep='grep --color=auto'
alias pmmi='perl Makefile.PL && mmi'

alias l="$EDITOR $HOME/.main.list"

alias d=cd
alias lsc=ls

alias ta='tmux attach -dt'
alias ts='tmux new -s'

alias tto='telnet termcast.org'

if check_exec gls
then
    alias ls='gls --color=auto'
else
    alias ls='ls --color=auto'
fi
alias sl='ls'
alias lcd='ls;cd'
for vim_typo in viim vmi bim cim vo, viom vin ivm vom; do alias "$vim_typo"='vim'; done
for rails_typo in ralis rials; do alias "$rails_typo"='rails'; done

alias -- '-'='popd'

alias deps='cpanm --installdeps -n'

alias culex='ssh 192.168.1.42'

alias irc='dtach -A ~/.irssi.sock irssi'

alias develop='git checkout develop'

alias ttt='tmux attach -t'

function vd() {
    vim $(git st --porcelain | awk '$1 == "M" {print $2}')
}

function vack() {
    vim $(ack -l -- $*)
}

function abs() { perl -MCwd=abs_path -le "print abs_path q[$1]" }

TERMCAST_SCRIPT=$(which termcast 2>/dev/null)
function termcast() {
    if [ "x$IN_TERMCAST" == "x" ]
    then
        IN_TERMCAST=1 $TERMCAST_SCRIPT $*
    else
        echo "You are already termcasting!" > /dev/stderr
    fi
}

function perldoc {
    if which cpandoc > /dev/null 2>&1; then
        cpandoc "$@"
    else
        command perldoc "$@"
    fi
}

function jj() {
    git jump merge
    git jump diff
}

function viack() {
    vim -q =(ack -H --no-group "$@")
}

function plackapp() {
    APP_PACKAGE="$1"; shift

    plackup -M"$APP_PACKAGE" -e "${APP_PACKAGE}->new->to_app" $@
}

