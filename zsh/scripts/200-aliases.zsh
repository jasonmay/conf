function mud() {
    rlwrap telnet "$1" 6715
}

function mem_usage {
    ps -eo size,ucmd | sort -rn | head -n$([ -z "$1" ] && echo 20 || echo $1)
}

function pubkey {
    [ -e "$HOME/.ssh/id_dsa.pub" ] || ssh-keygen -t dsa
    ssh "$1" "mkdir -p .ssh; cat - >> .ssh/authorized_keys" \
        < "$HOME/.ssh/id_dsa.pub"
}

alias grep='grep --color=auto'

alias netstat_useful="netstat -a --inet --numeric-port"

alias grep='grep --color=auto'
alias ll='ls -lhA'
alias mmi='make && sudo make install'
alias pmmi='perl Makefile.PL && mmi'

# only assuming EVERY tag is a CPAN release
alias downgrade-to-cpan='git reset --hard $(git describe --abbrev=0)'

alias vall='vim lib/**/*.pm'


alias cheese='ssh '"$WORK_DEV_AUTH"' -t ssh 10.1.1.81'
alias workdev="ssh $WORK_DEV_AUTH"
alias wdd="ssh $WORK_DEV_AUTH -t screen -dr dev"
alias prod="ssh $WORK_PROD_AUTH"
alias ]='gnome-open'
alias moose='perl -Moose -E'

alias d=cd
alias lsc=ls

alias ta='tmux attach -dt'
alias ts='tmux new -s'

alias tto='telnet termcast.org'

alias sl='ls'
alias lcd='ls;cd'
for vim_typo in viim vmi bim cim vo, viom vin ivm vom; do alias "$vim_typo"='vim'; done

alias pi='perl -Ilib'

alias -- '-'='popd'

alias prove6='prove -e perl6'

alias deps='cpanm --installdeps -n'

alias working-cat-dbic-api='cpanm -f LSAUNDERS/Catalyst-Controller-DBIC-API-1.002001.tar.gz'
alias working-dbic='cpanm -f RIBASUSHI/DBIx-Class-0.08120'
alias working-mx-traits='cpanm -f JROCKWAY/MooseX-Traits-0.09'

function vack() {
    vim $(ack -l -- $*)
}

function abs() { perl -MCwd=abs_path -le "print abs_path q[$1]" }

function ms() {
    check_exec 'module-starter' && module-starter --module=$1 --author="Jason May" --email=jason.a.may@gmail.com
    cd `echo "$1" | sed 's/::/-/g'`
    cp ignore.txt .gitignore
    mv ignore.txt MANIFEST.SKIP
    git init && git add . && git commit -m 'initial commit'
}

