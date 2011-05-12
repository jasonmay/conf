case $MY_HOSTNAME in
    jarsonmar|abby)
    alias ls='ls --color=auto'
    alias less='less -R'

    alias i='sudo pacman -S'
    function s() {
        [ -z "$1" ] || sudo pacman -Ss $1
    }
    alias ar='sudo /etc/rc.d/httpd restart'
    ;;

esac
