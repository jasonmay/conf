case $(uname) in
    Darwin)

    alias ls='gls --color=auto'
    alias sort='gsort'
    alias uniq='guniq'
    alias cp='gcp'
    alias cat='gcat'
    alias basename='gbasename'
    alias chown='gchown'
    alias chmod='gchmod'
    alias du='gdu'
    alias i='brew install'

    alias culex='ssh 192.168.1.42'

#alias mysqlstart='/Users/jasonmay/.brew/Cellar/mysql/5.1.49/share/mysql/mysql.server start'
#alias mysqlstop='/Users/jasonmay/.brew/Cellar/mysql/5.1.49/share/mysql/mysql.server stop'

    function s() {
        [ -z "$*" ] && return

        echo "searching homebrew..."
        brew search $*
    }

;;

esac
