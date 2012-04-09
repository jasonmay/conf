if [ -e /etc/debian_version ]
then
    alias i='sudo apt-get install'
    function s() {
        [ -z "$1" ] || sudo apt-cache search $*
    }
fi
