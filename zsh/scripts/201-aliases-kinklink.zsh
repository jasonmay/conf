case $MY_HOSTNAME in
    kinklink.local)
alias ls='gls --color=auto'
alias sort='gsort'
alias uniq='guniq'
alias cp='gcp'
alias cat='gcat'
alias basename='gbasename'
alias chown='gchown'
alias chmod='gchmod'
alias du='gdu'

#alias mysqlstart='/Users/jasonmay/.brew/Cellar/mysql/5.1.49/share/mysql/mysql.server start'
#alias mysqlstop='/Users/jasonmay/.brew/Cellar/mysql/5.1.49/share/mysql/mysql.server stop'

alias i='sudo port -v install'
function s() {
    [ -z "$*" ] && return

    echo "searching macports..."
    sudo port search $*
    echo "searching homebrew..."
    brew search $*
}
alias v='sudo port variants'
alias ar='sudo /opt/local/apache2/bin/apachectl restart && echo uhh success'

function nasadbstagingtunnel() {
    ssh -fN -L $NASA_DBLOCALPORT:127.0.0.1:$NASA_DBREMOTEPORT $DEVSERVER
}
function mogiletunnel() {
    ssh -fN -L $NASA_MOGPORT:127.0.0.1:$NASA_MOGPORT $DEVSERVER
}
function mogstoretunnel() {
    ssh -fN -L $NASA_MOGSTOREPORT:127.0.0.1:$NASA_MOGSTOREPORT $DEVSERVER
}

function setup_tunnels() {
    nasadbstagingtunnel
    mogiletunnel
    mogstoretunnel
}
;;

esac
